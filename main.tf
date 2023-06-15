locals {
  shared_labels = merge({
    "owner"               = replace(var.labels["owner"], " ", "_")
    "cmdb_appid"          = replace(var.labels["cmdb_appid"], " ", "_")
    "cost_centre"         = replace(var.labels["cost_centre"], " ", "_")
    "data_classification" = replace(var.labels["data_classification"], " ", "_")
    "environment"         = replace(var.labels["environment"], " ", "_")
  }, var.labels)
}

resource "null_resource" "clone_repository" {
  provisioner "local-exec" {
    command = <<-EOT
        # Create a temporary directory for the clone/copy
        temp_dir="${var.folder_name}_temp"
        mkdir -p "$temp_dir"

        # Clone or copy the repository into the temporary directory
        if [ -n "${var.github_url}" ]; then
          echo "Cloning from Github: ${var.github_url}"
          git clone "${var.github_url}" "$temp_dir"
        elif [ -n "${var.local_folder}" ]; then
          echo "Copying from local folder: ${var.local_folder}"
          cp -r "${var.local_folder}" "$temp_dir"
        else
          echo "Error: No Github URL or local folder specified"
          exit 1
        fi

        # Move the files into the main directory
        mv $temp_dir/* "${var.folder_name}"
        rm -rf "$temp_dir"

        # Log directory and file status for debugging
        echo "Directory contents after operation:"
        ls "${var.folder_name}"
    EOT
  }
}

# Archive the repository
data "archive_file" "repository_archive" {
  depends_on  = [null_resource.clone_repository]
  type        = "zip"
  source_dir  = var.folder_name
  output_path = "${var.zip_name}.zip"
}

# Upload the archive to Google Cloud Storage
resource "google_storage_bucket_object" "archive" {
  depends_on = [data.archive_file.repository_archive]
  count      = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? 1 : 0
  name       = "${var.zip_name}.zip"
  bucket     = var.function_archive_bucket_name
  source     = data.archive_file.repository_archive.output_path
}


# Create the Google Cloud Function
resource "google_cloudfunctions_function" "cloud_function" {
  name        = var.function_name
  description = "${var.function_name} cloud function"
  runtime     = var.runtime

  available_memory_mb = var.available_memory_mb
  timeout             = var.timeout

  source_archive_bucket         = var.function_archive_bucket_name
  source_archive_object         = google_storage_bucket_object.archive[0].name
  entry_point                   = var.entry_point
  environment_variables         = var.environment_vars
  ingress_settings              = var.ingress_settings
  service_account_email         = var.service_account_email == null ? "" : var.service_account_email
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  max_instances                 = var.max_instances

  lifecycle {
    create_before_destroy = true
  }

  # Define the event trigger if necessary
  dynamic "event_trigger" {
    for_each = var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? [1] : []
    content {
      event_type = var.trigger_type == var.trigger_type_pubsub ? var.trigger_event_type_pubsub : var.trigger_event_type_bucket
      resource   = var.trigger_event_resource

      failure_policy {
        retry = true
      }

    }

  }
  trigger_http = var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? null : true

  build_environment_variables = var.build_env_vars
  build_worker_pool           = var.build_worker_pool

  kms_key_name = var.encryption_type == "CUSTOMER_MANAGED_KEY" ? var.kms_key_name : null

  labels = local.shared_labels

}


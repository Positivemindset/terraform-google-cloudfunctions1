locals {
  shared_labels = merge({
    "owner"               = replace(var.labels["owner"], " ", "_")
    "cmdb_appid"          = replace(var.labels["cmdb_appid"], " ", "_")
    "cost_centre"         = replace(var.labels["cost_centre"], " ", "_")
    "data_classification" = replace(var.labels["data_classification"], " ", "_")
    "environment"         = replace(var.labels["environment"], " ", "_")
  }, var.labels)
}

/* 
data "google_artifact_registry_repository" "my_repository" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
}
 */

# Clone the repository
resource "null_resource" "clone_repository" {
  provisioner "local-exec" {
    command = <<-EOT
        if [ -d ${var.folder_name} ]; then
          rm -rf ${var.folder_name}
        fi
        if [ -n "${var.github_url}" ]; then
          git clone ${var.github_url} ${var.folder_name}
        elif [ -n "${var.local_folder}" ]; then
          cp -r ${var.local_folder} ${var.folder_name}
        else
          echo "Error: No Github URL or local folder specified"
          exit 1
        fi
      EOT
  }
}


# Archive the repository
data "archive_file" "repository_archive" {
  count = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? 1 : 0
  depends_on = [
    null_resource.clone_repository
  ]
  type        = "zip"
  source_dir  = var.folder_name
  output_path = "${var.zip_name}.zip"
}

# Upload the archive to Google Cloud Storage
resource "google_storage_bucket_object" "archive" {
  count  = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? 1 : 0
  name   = "${var.zip_name}.zip"
  bucket = var.function_archive_bucket_name
  source = data.archive_file.repository_archive[count.index].output_path
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

  docker_registry   = var.docker_registry
  docker_repository = var.docker_repository
}


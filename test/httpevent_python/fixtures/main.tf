module "http_python_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  folder_name                   = var.folder_name
  function_name                 = var.function_name
  runtime                       = var.runtime
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.trigger_type
  encryption_type               = var.encryption_type
  created_by                    = var.created_by
  description                   = var.description
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.zip_name
  function_archive_bucket_name  = var.function_archive_bucket_name
}




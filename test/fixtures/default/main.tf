# Python HTTP Cloud Function
module "http_python_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.http_local_folder_python
  folder_name                   = var.http_folder_name_python
  function_name                 = var.http_function_name_python
  runtime                       = var.http_runtime_python
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point_python
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.http_trigger_type_python
  trigger_event_resource        = null
  encryption_type               = var.http_encryption_type_python
  created_by                    = var.created_by
  description                   = var.http_description_python
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.http_zip_name_python
  function_archive_bucket_name  = var.http_function_archive_bucket_name_python
}

# Python Pub/Sub Cloud Function
module "pubsub_python_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.pubsub_local_folder_python
  folder_name                   = var.pubsub_folder_name_python
  function_name                 = var.pubsub_function_name_python
  runtime                       = var.pubsub_runtime_python
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point_python
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.pubsub_trigger_type_python
  trigger_event_resource        = var.pubsub_trigger_event_resource_python
  encryption_type               = var.pubsub_encryption_type_python
  created_by                    = var.created_by
  description                   = var.pubsub_description_python
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.pubsub_zip_name_python
  function_archive_bucket_name  = var.pubsub_function_archive_bucket_name_python
  trigger_event_type_pubsub     = var.pubsub_trigger_event_type_pubsub_python
}

# Python Storage Cloud Function
module "storage_python_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.storage_local_folder_python
  folder_name                   = var.storage_folder_name_python
  function_name                 = var.storage_function_name_python
  runtime                       = var.storage_runtime_python
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point_python
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.storage_trigger_type_python
  trigger_event_resource        = var.storage_trigger_event_resource_python
  encryption_type               = var.storage_encryption_type_python
  created_by                    = var.created_by
  description                   = var.storage_description_python
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.storage_zip_name_python
  function_archive_bucket_name  = var.storage_function_archive_bucket_name_python
}

# .NET HTTP Cloud Function
module "http_dotnet_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.http_local_folder_dotnet
  folder_name                   = var.http_folder_name_dotnet
  function_name                 = var.http_function_name_dotnet
  runtime                       = var.http_runtime_dotnet
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point_dotnet
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.http_trigger_type_dotnet
  trigger_event_resource        = null
  encryption_type               = var.http_encryption_type_dotnet
  created_by                    = var.created_by
  description                   = var.http_description_dotnet
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.http_zip_name_dotnet
  function_archive_bucket_name  = var.http_function_archive_bucket_name_dotnet
}

# .NET Pub/Sub Cloud Function
module "pubsub_dotnet_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.pubsub_local_folder_dotnet
  folder_name                   = var.pubsub_folder_name_dotnet
  function_name                 = var.pubsub_function_name_dotnet
  runtime                       = var.pubsub_runtime_dotnet
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point_dotnet
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.pubsub_trigger_type_dotnet
  trigger_event_resource        = var.pubsub_trigger_event_resource_dotnet
  encryption_type               = var.pubsub_encryption_type_dotnet
  created_by                    = var.created_by
  description                   = var.pubsub_description_dotnet
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.pubsub_zip_name_dotnet
  function_archive_bucket_name  = var.pubsub_function_archive_bucket_name_dotnet
  trigger_event_type_pubsub     = var.pubsub_trigger_event_type_pubsub_dotnet
}

# .NET Storage Cloud Function
module "storage_dotnet_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.storage_local_folder_dotnet
  folder_name                   = var.storage_folder_name_dotnet
  function_name                 = var.storage_function_name_dotnet
  runtime                       = var.storage_runtime_dotnet
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point_dotnet
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.storage_trigger_type_dotnet
  trigger_event_resource        = var.storage_trigger_event_resource_dotnet
  encryption_type               = var.storage_encryption_type_dotnet
  created_by                    = var.created_by
  description                   = var.storage_description_dotnet
  owner                         = var.owner
  project_id                    = var.project_id
  zip_name                      = var.storage_zip_name_dotnet
  function_archive_bucket_name  = var.storage_function_archive_bucket_name_dotnet
}

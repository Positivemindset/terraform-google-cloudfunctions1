output "project_id" {
  value       = var.project_id
  description = "Project ID"
}

output "available_memory_mb" {
  value       = var.available_memory_mb
  description = "Available memory in MB"
}

output "timeout" {
  value       = var.timeout
  description = "Timeout in seconds"
}

output "environment_vars" {
  value       = var.environment_vars
  description = "Environment variables"
}

output "ingress_settings" {
  value       = var.ingress_settings
  description = "Ingress settings"
}

output "vpc_connector_egress_settings" {
  value       = var.vpc_connector_egress_settings
  description = "VPC connector egress settings"
}

output "vpc_connector" {
  value       = var.vpc_connector
  description = "VPC connector"
}

output "service_account_email" {
  value       = var.service_account_email
  description = "Service account email"
}

output "max_instances" {
  value       = var.max_instances
  description = "Maximum number of instances"
}

output "github_url" {
  value       = var.github_url
  description = "GitHub URL"
}

output "kms_key_name" {
  value       = var.kms_key_name
  description = "KMS key name"
}

output "entry_point_python" {
  value       = var.entry_point_python
  description = "Entry point for Python"
}

output "entry_point_dotnet" {
  value       = var.entry_point_dotnet
  description = "Entry point for Dotnet"
}

output "http_description_python" {
  value       = var.http_description_python
  description = "HTTP description for Python"
}

output "http_function_name_python" {
  value       = var.http_function_name_python
  description = "HTTP function name for Python"
}

output "http_runtime_python" {
  value       = var.http_runtime_python
  description = "HTTP runtime for Python"
}

output "http_local_folder_python" {
  value       = var.http_local_folder_python
  description = "HTTP local folder for Python"
}

output "http_folder_name_python" {
  value       = var.http_folder_name_python
  description = "HTTP folder name for Python"
}

output "http_trigger_type_python" {
  value       = var.http_trigger_type_python
  description = "HTTP trigger type for Python"
}

output "http_encryption_type_python" {
  value       = var.http_encryption_type_python
  description = "HTTP encryption type for Python"
}

output "http_zip_name_python" {
  value       = var.http_zip_name_python
  description = "HTTP zip name for Python"
}

output "http_function_archive_bucket_name_python" {
  value       = var.http_function_archive_bucket_name_python
  description = "HTTP function archive bucket name for Python"
}

output "pubsub_description_python" {
  value       = var.pubsub_description_python
  description = "Pub/Sub description for Python"
}

output "pubsub_function_name_python" {
  value       = var.pubsub_function_name_python
  description = "Pub/Sub function name for Python"
}

output "pubsub_runtime_python" {
  value       = var.pubsub_runtime_python
  description = "Pub/Sub runtime for Python"
}

output "pubsub_folder_name_python" {
  value       = var.pubsub_folder_name_python
  description = "Pub/Sub folder name for Python"
}

output "pubsub_trigger_type_python" {
  value       = var.pubsub_trigger_type_python
  description = "Pub/Sub trigger type for Python"
}

output "pubsub_trigger_event_type_pubsub_python" {
  value       = var.pubsub_trigger_event_type_pubsub_python
  description = "Pub/Sub trigger event type for Python"
}

output "pubsub_trigger_event_resource_python" {
  value       = var.pubsub_trigger_event_resource_python
  description = "Pub/Sub trigger event resource for Python"
}

output "pubsub_encryption_type_python" {
  value       = var.pubsub_encryption_type_python
  description = "Pub/Sub encryption type for Python"
}

output "pubsub_zip_name_python" {
  value       = var.pubsub_zip_name_python
  description = "Pub/Sub zip name for Python"
}

output "pubsub_function_archive_bucket_name_python" {
  value       = var.pubsub_function_archive_bucket_name_python
  description = "Pub/Sub function archive bucket name for Python"
}

output "pubsub_local_folder_python" {
  value       = var.pubsub_local_folder_python
  description = "Pub/Sub local folder for Python"
}

output "storage_description_python" {
  value       = var.storage_description_python
  description = "Storage description for Python"
}

output "storage_function_name_python" {
  value       = var.storage_function_name_python
  description = "Storage function name for Python"
}

output "storage_runtime_python" {
  value       = var.storage_runtime_python
  description = "Storage runtime for Python"
}

output "storage_folder_name_python" {
  value       = var.storage_folder_name_python
  description = "Storage folder name for Python"
}

output "storage_trigger_type_python" {
  value       = var.storage_trigger_type_python
  description = "Storage trigger type for Python"
}

output "storage_trigger_event_resource_python" {
  value       = var.storage_trigger_event_resource_python
  description = "Storage trigger event resource for Python"
}

output "storage_encryption_type_python" {
  value       = var.storage_encryption_type_python
  description = "Storage encryption type for Python"
}

output "storage_zip_name_python" {
  value       = var.storage_zip_name_python
  description = "Storage zip name for Python"
}

output "storage_function_archive_bucket_name_python" {
  value       = var.storage_function_archive_bucket_name_python
  description = "Storage function archive bucket name for Python"
}

output "storage_local_folder_python" {
  value       = var.storage_local_folder_python
  description = "Storage local folder for Python"
}

output "http_description_dotnet" {
  value       = var.http_description_dotnet
  description = "HTTP description for Dotnet"
}

output "http_function_name_dotnet" {
  value       = var.http_function_name_dotnet
  description = "HTTP function name for Dotnet"
}

output "http_runtime_dotnet" {
  value       = var.http_runtime_dotnet
  description = "HTTP runtime for Dotnet"
}

output "http_folder_name_dotnet" {
  value       = var.http_folder_name_dotnet
  description = "HTTP folder name for Dotnet"
}

output "http_trigger_type_dotnet" {
  value       = var.http_trigger_type_dotnet
  description = "HTTP trigger type for Dotnet"
}

output "http_encryption_type_dotnet" {
  value       = var.http_encryption_type_dotnet
  description = "HTTP encryption type for Dotnet"
}

output "http_zip_name_dotnet" {
  value       = var.http_zip_name_dotnet
  description = "HTTP zip name for Dotnet"
}

output "http_function_archive_bucket_name_dotnet" {
  value       = var.http_function_archive_bucket_name_dotnet
  description = "HTTP function archive bucket name for Dotnet"
}

output "http_local_folder_dotnet" {
  value       = var.http_local_folder_dotnet
  description = "HTTP local folder for Dotnet"
}

output "pubsub_description_dotnet" {
  value       = var.pubsub_description_dotnet
  description = "Pub/Sub description for Dotnet"
}

output "pubsub_function_name_dotnet" {
  value       = var.pubsub_function_name_dotnet
  description = "Pub/Sub function name for Dotnet"
}

output "pubsub_runtime_dotnet" {
  value       = var.pubsub_runtime_dotnet
  description = "Pub/Sub runtime for Dotnet"
}

output "pubsub_folder_name_dotnet" {
  value       = var.pubsub_folder_name_dotnet
  description = "Pub/Sub folder name for Dotnet"
}

output "pubsub_trigger_type_dotnet" {
  value       = var.pubsub_trigger_type_dotnet
  description = "Pub/Sub trigger type for Dotnet"
}

output "pubsub_trigger_event_type_pubsub_dotnet" {
  value       = var.pubsub_trigger_event_type_pubsub_dotnet
  description = "Pub/Sub trigger event type for Dotnet"
}

output "pubsub_trigger_event_resource_dotnet" {
  value       = var.pubsub_trigger_event_resource_dotnet
  description = "Pub/Sub trigger event resource for Dotnet"
}

output "pubsub_encryption_type_dotnet" {
  value       = var.pubsub_encryption_type_dotnet
  description = "Pub/Sub encryption type for Dotnet"
}

output "pubsub_zip_name_dotnet" {
  value       = var.pubsub_zip_name_dotnet
  description = "Pub/Sub zip name for Dotnet"
}

output "pubsub_function_archive_bucket_name_dotnet" {
  value       = var.pubsub_function_archive_bucket_name_dotnet
  description = "Pub/Sub function archive bucket name for Dotnet"
}

output "pubsub_local_folder_dotnet" {
  value       = var.pubsub_local_folder_dotnet
  description = "Pub/Sub local folder for Dotnet"
}

output "storage_description_dotnet" {
  value       = var.storage_description_dotnet
  description = "Storage description for Dotnet"
}

output "storage_function_name_dotnet" {
  value       = var.storage_function_name_dotnet
  description = "Storage function name for Dotnet"
}

output "storage_runtime_dotnet" {
  value       = var.storage_runtime_dotnet
  description = "Storage runtime for Dotnet"
}

output "storage_folder_name_dotnet" {
  value       = var.storage_folder_name_dotnet
  description = "Storage folder name for Dotnet"
}

output "storage_trigger_type_dotnet" {
  value       = var.storage_trigger_type_dotnet
  description = "Storage trigger type for Dotnet"
}

output "storage_trigger_event_resource_dotnet" {
  value       = var.storage_trigger_event_resource_dotnet
  description = "Storage trigger event resource for Dotnet"
}

output "storage_encryption_type_dotnet" {
  value       = var.storage_encryption_type_dotnet
  description = "Storage encryption type for Dotnet"
}

output "storage_zip_name_dotnet" {
  value       = var.storage_zip_name_dotnet
  description = "Storage zip name for Dotnet"
}

output "storage_function_archive_bucket_name_dotnet" {
  value       = var.storage_function_archive_bucket_name_dotnet
  description = "Storage function archive bucket name for Dotnet"
}

output "storage_local_folder_dotnet" {
  value       = var.storage_local_folder_dotnet
  description = "Storage local folder for Dotnet"
}



# Cloud Function basic configuration
variable "created_by" {
  description = "The name of the person or team that created the resource"
  type        = string
}


variable "owner" {
  description = "The name of the person or team that owns the resource"
  type        = string
}
variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}


variable "available_memory_mb" {
  description = "Memory allocated to the Cloud Function in MB"
  type        = number
}

variable "timeout" {
  description = "Timeout for the Cloud Function in seconds"
  type        = number
}

# GitHub repository URL for Cloud Function deployment
variable "github_url" {
  description = "URL of the GitHub repository to deploy the Cloud Function from"
  type        = string
  default     = null

}

# Local folder name for cloning the GitHub repository
variable "http_folder_name" {
  description = "Name of the local folder to clone the repository to"
  type        = string
}



# Cloud Function entry point
variable "entry_point" {
  description = "Name of the function to be executed in the Cloud Function"
  type        = string
  default     = ""
}

# Environment variables
variable "environment_vars" {
  description = "Environment variables for the Cloud Function"
  type        = map(string)
  default     = {}
}

variable "ingress_settings" {
  description = "Ingress settings for the cloud function"
  type        = string
}

# Service account email
variable "service_account_email" {
  description = "Service account email for the Cloud Function"
  type        = string
}

# VPC connector egress settings
variable "vpc_connector_egress_settings" {
  description = "Egress settings for the VPC connector"
  type        = string
}

# VPC connector
variable "vpc_connector" {
  description = "VPC connector for the Cloud Function"
  type        = string
}

# Maximum number of instances
variable "max_instances" {
  description = "Maximum number of instances for the Cloud Function"
  type        = number
}


# HTTP trigger type constant
variable "trigger_type_http" {
  description = "Constant for the HTTP trigger type"
  type        = string
  default     = "HTTP_TRIGGER"
}

# Pub/Sub trigger type constant
variable "trigger_type_pubsub" {
  description = "Constant for the Pub/Sub trigger type"
  type        = string
  default     = "PUBSUB_TRIGGER"
}

# Cloud Storage trigger type constant
variable "trigger_type_bucket" {
  description = "Type of Cloud Storage trigger for the Cloud Function"
  type        = string
  default     = "BUCKET_TRIGGER"
}

# Pub/Sub trigger event type
variable "trigger_event_type_pubsub" {
  description = "Event type for the Pub/Sub trigger"
  type        = string
  default     = "google.pubsub.topic.publish"
}

# Cloud Storage trigger event type
variable "trigger_event_type_bucket" {
  description = "Event type for the Cloud Storage trigger"
  type        = string
  default     = "google.storage.object.finalize"
}

# Trigger event resource
variable "trigger_event_resource" {
  description = "Resource for the event trigger"
  type        = string
  default     = null
}



# Build worker pool
variable "build_worker_pool" {
  description = "Build worker pool for the Cloud Function"
  type        = string
  default     = null
}

# Build environment variables
variable "build_env_vars" {
  description = "Build environment variables for the Cloud Function"
  type        = map(string)
  default     = {}
}


# KMS key name for customer-managed encryption
variable "kms_key_name" {
  description = "KMS key name for customer-managed encryption"
  type        = string
  default     = null
}

variable "http_function_name" {
  description = "Name of the Cloud Function for HTTP trigger"
  type        = string
}

variable "http_runtime" {
  description = "Runtime of the Cloud Function for HTTP trigger"
  type        = string
}

variable "http_trigger_type" {
  description = "Type of trigger for the Cloud Function for HTTP trigger"
  type        = string
}

variable "http_encryption_type" {
  description = "Encryption type for the Cloud Function for HTTP trigger"
  type        = string
}

variable "http_description" {
  description = "A description of the Cloud Function for HTTP trigger"
  type        = string
}
variable "http_local_folder" {
  description = "The path to the local folder containing the function source code for http trigger"
  type        = string
}
variable "http_zip_name" {
  description = "Name of the archive to create from the local folder for HTTP trigger"
  type        = string
}

variable "http_function_archive_bucket_name" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for HTTP trigger"
  type        = string
}

variable "pubsub_local_folder" {
  description = "The path to the local folder containing the function source code for Pub/Sub trigger"
  type        = string
}

variable "pubsub_folder_name" {
  description = "Name of the local folder to clone the repository to for Pub/Sub trigger"
  type        = string
}

variable "pubsub_function_name" {
  description = "Name of the Cloud Function for Pub/Sub trigger"
  type        = string
}

variable "pubsub_runtime" {
  description = "Runtime of the Cloud Function for Pub/Sub trigger"
  type        = string
}

variable "pubsub_zip_name" {
  description = "Name of the archive to create from the local folder for HTTP trigger"
  type        = string
}
variable "pubsub_encryption_type" {
  description = "Encryption type for the Cloud Function for Pub/Sub trigger"
  type        = string
}

variable "pubsub_description" {
  description = "A description of the Cloud Function for Pub/Sub trigger"
  type        = string
}

variable "pubsub_function_archive_bucket_name" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for Pub/Sub trigger"
  type        = string
}
variable "pubsub_trigger_type" {
  description = "Type of trigger for the Cloud Function for pubsub trigger"
  type        = string
}
variable "pubsub_trigger_event_resource" {
  description = "Resource for the event trigger for Pub/Sub trigger"
  type        = string
}
variable "pubsub_trigger_event_type_pubsub" {
  description = "Event type for the Pub/Sub trigger for the Cloud Function"
  type        = string
}
variable "storage_folder_name" {
  description = "Name of the local folder to clone the repository to for Cloud Storage trigger"
  type        = string
}

variable "storage_function_name" {
  description = "Name of the Cloud Function for Cloud Storage trigger"
  type        = string
}

variable "storage_runtime" {
  description = "Runtime of the Cloud Function for Cloud Storage trigger"
  type        = string
}

variable "storage_trigger_type" {
  description = "Type of trigger for the Cloud Function for Cloud Storage trigger"
  type        = string
}

variable "storage_trigger_event_resource" {
  description = "Resource for the event trigger for Cloud Storage trigger"
  type        = string
}

variable "storage_encryption_type" {
  description = "Encryption type for the Cloud Function for Cloud Storage trigger"
  type        = string
}

variable "storage_description" {
  description = "A description of the Cloud Function for Cloud Storage trigger"
  type        = string
}

variable "storage_zip_name" {
  description = "Name of the archive to create from the local folder for Cloud Storage trigger"
  type        = string
}

variable "storage_function_archive_bucket_name" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for Cloud Storage trigger"
  type        = string
}
variable "storage_local_folder" {
  description = "The path to the local folder containing the function source code for storage trigger"
  type        = string
}
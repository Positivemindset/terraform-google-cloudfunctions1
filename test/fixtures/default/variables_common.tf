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

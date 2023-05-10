variable "pubsub_folder_name_dotnet" {
  description = "Name of the local folder to clone the repository to for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_function_name_dotnet" {
  description = "Name of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_runtime_dotnet" {
  description = "Runtime of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_zip_name_dotnet" {
  description = "Name of the archive to create from the local folder for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_description_dotnet" {
  description = "A description of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_function_archive_bucket_name_dotnet" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for .NET Pub/Sub trigger"
  type        = string
}

variable "storage_folder_name_dotnet" {
  description = "Name of the local folder to clone the repository to for .NET Cloud Storage trigger"
  type        = string
}

variable "storage_function_name_dotnet" {
  description = "Name of the Cloud Function for .NET Cloud Storage trigger"
  type        = string
}

variable "storage_runtime_dotnet" {
  description = "Runtime of the Cloud Function for .NET Cloud Storage trigger"
  type        = string
}

variable "storage_trigger_event_resource_dotnet" {
  description = "Resource for the event trigger for .NET Cloud Storage trigger"
  type        = string
}

variable "storage_description_dotnet" {
  description = "A description of the Cloud Function for .NET Cloud Storage trigger"
  type        = string
}

variable "storage_zip_name_dotnet" {
  description = "Name of the archive to create from the local folder for .NET Cloud Storage trigger"
  type        = string
}

variable "storage_function_archive_bucket_name_dotnet" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for .NET Cloud Storage trigger"
  type        = string
}

# Local folder name for cloning the GitHub repository
variable "http_folder_name_dotnet" {
  description = "Name of the local folder to clone the repository to"
  type        = string
}


variable "http_function_name_dotnet" {
  description = "Name of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "http_runtime_dotnet" {
  description = "Runtime of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "http_zip_name_dotnet" {
  description = "Name of the archive to create from the local folder for .NET Pub/Sub trigger"
  type        = string
}

variable "http_description_dotnet" {
  description = "A description of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "http_function_archive_bucket_name_dotnet" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for .NET Pub/Sub trigger"
  type        = string
}
variable "http_local_folder_dotnet" {
  description = "The path to the local folder containing the function source code for .NET HTTP trigger"
  type        = string
}

variable "entry_point_dotnet" {
  description = "Name of the function to be executed in the .NET Cloud Function"
  type        = string
  default     = ""
}

variable "pubsub_local_folder_dotnet" {
  description = "The path to the local folder containing the function source code for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_trigger_event_resource_dotnet" {
  description = "Resource for the event trigger for .NET Pub/Sub trigger"
  type        = string
}

variable "pubsub_trigger_event_type_pubsub_dotnet" {
  description = "Event type for the .NET Pub/Sub trigger for the Cloud Function"
  type        = string
}

variable "storage_local_folder_dotnet" {
  description = "The path to the local folder containing the function source code for .NET Cloud Storage trigger"
  type        = string
}

variable "http_trigger_type_dotnet" {
  description = "Type of trigger for the Python Cloud Function for HTTP trigger"
  type        = string
}
variable "pubsub_trigger_type_dotnet" {
  description = "Type of trigger for the .NET Cloud Function for Pub/Sub trigger"
  type        = string
}


variable "pubsub_encryption_type_dotnet" {
  description = "Encryption type for the .NET Cloud Function for Pub/Sub trigger"
  type        = string
}

variable "http_encryption_type_dotnet" {
  description = "Encryption type for the .NET Cloud Function for HTTP trigger"
  type        = string
}


variable "storage_trigger_type_dotnet" {
  description = "Type of trigger for the .NET Cloud Function for Cloud Storage trigger"
  type        = string
}


variable "storage_encryption_type_dotnet" {
  description = "Encryption type for the .NET Cloud Function for Cloud Storage trigger"
  type        = string
}

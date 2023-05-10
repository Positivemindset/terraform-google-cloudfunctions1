variable "pubsub_folder_name_python" {
  description = "Name of the local folder to clone the repository to for Python Pub/Sub trigger"
  type        = string
}

variable "pubsub_function_name_python" {
  description = "Name of the Cloud Function for Python Pub/Sub trigger"
  type        = string
}

variable "pubsub_runtime_python" {
  description = "Runtime of the Cloud Function for Python Pub/Sub trigger"
  type        = string
}

variable "pubsub_zip_name_python" {
  description = "Name of the archive to create from the local folder for Python Pub/Sub trigger"
  type        = string
}

variable "pubsub_description_python" {
  description = "A description of the Cloud Function for Python Pub/Sub trigger"
  type        = string
}

variable "pubsub_function_archive_bucket_name_python" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for Python Pub/Sub trigger"
  type        = string
}

variable "storage_folder_name_python" {
  description = "Name of the local folder to clone the repository to for Python Cloud Storage trigger"
  type        = string
}

variable "storage_function_name_python" {
  description = "Name of the Cloud Function for Python Cloud Storage trigger"
  type        = string
}

variable "storage_runtime_python" {
  description = "Runtime of the Cloud Function for Python Cloud Storage trigger"
  type        = string
}

variable "storage_trigger_event_resource_python" {
  description = "Resource for the event trigger for Python Cloud Storage trigger"
  type        = string
}

variable "storage_description_python" {
  description = "A description of the Cloud Function for Python Cloud Storage trigger"
  type        = string
}

variable "storage_zip_name_python" {
  description = "Name of the archive to create from the local folder for Python Cloud Storage trigger"
  type        = string
}

variable "storage_function_archive_bucket_name_python" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for Python Cloud Storage trigger"
  type        = string
}

# Local folder name for cloning the GitHub repository
variable "http_folder_name_python" {
  description = "Name of the local folder to clone the repository to"
  type        = string
}


variable "http_function_name_python" {
  description = "Name of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "http_runtime_python" {
  description = "Runtime of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "http_zip_name_python" {
  description = "Name of the archive to create from the local folder for .NET Pub/Sub trigger"
  type        = string
}

variable "http_description_python" {
  description = "A description of the Cloud Function for .NET Pub/Sub trigger"
  type        = string
}

variable "http_function_archive_bucket_name_python" {
  description = "Name of the Google Cloud Storage bucket containing the function archive for .NET Pub/Sub trigger"
  type        = string
}

variable "entry_point_python" {
  description = "Name of the function to be executed in the Cloud Function for Python runtime"
  type        = string
}
variable "http_local_folder_python" {
  description = "The path to the local folder containing the function source code for Python HTTP trigger"
  type        = string
}
variable "pubsub_local_folder_python" {
  description = "The path to the local folder containing the function source code for Python Pub/Sub trigger"
  type        = string
}

variable "pubsub_trigger_event_resource_python" {
  description = "Resource for the event trigger for Python Pub/Sub trigger"
  type        = string
}



variable "pubsub_trigger_event_type_pubsub_python" {
  description = "Event type for the Python Pub/Sub trigger for the Cloud Function"
  type        = string
}

variable "storage_local_folder_python" {
  description = "The path to the local folder containing the function source code for Python Cloud Storage trigger"
  type        = string
}
variable "http_trigger_type_python" {
  description = "Type of trigger for the Python Cloud Function for HTTP trigger"
  type        = string
}


variable "pubsub_trigger_type_python" {
  description = "Type of trigger for the Python Cloud Function for Pub/Sub trigger"
  type        = string
}

variable "pubsub_encryption_type_python" {
  description = "Encryption type for the Python Cloud Function for Pub/Sub trigger"
  type        = string
}
variable "http_encryption_type_python" {
  description = "Encryption type for the Python Cloud Function for HTTP trigger"
  type        = string
}
variable "storage_encryption_type_python" {
  description = "Encryption type for the Python Cloud Function for Cloud Storage trigger"
  type        = string
}
variable "storage_trigger_type_python" {
  description = "Type of trigger for the Python Cloud Function for Cloud Storage trigger"
  type        = string
}

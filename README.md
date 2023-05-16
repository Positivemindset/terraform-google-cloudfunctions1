# Google Cloud Functions Terraform Module
This Terraform module deploys a Google Cloud Function from a GitHub repository. It supports both HTTP-triggered and event-triggered functions. The module clones the repository, installs necessary packages, zips the code, uploads it to a Google Cloud Storage bucket, and creates the Cloud Function.

## Features
* **Supports HTTP-triggered and event-triggered functions.**
* **Clones a GitHub repository containing the function code.**
* **Installs Python or .NET packages.**
* **Zips the function code and uploads it to a Google Cloud Storage bucket.**
* **Creates the Cloud Function with custom settings, including memory, timeout, ingress, and VPC configuration.**


## Usage
# Google Cloud Functions Terraform Module

This Terraform module deploys Google Cloud Functions from a GitHub repository. It supports both HTTP-triggered and event-triggered functions. The module clones the repository, installs necessary packages, zips the code, uploads it to a Google Cloud Storage bucket, and creates the Cloud Functions.

## Features

- **Supports HTTP-triggered and event-triggered functions.**
- **Clones a GitHub repository containing the function code.**
- **Installs Python or .NET packages.**
- **Zips the function code and uploads it to a Google Cloud Storage bucket.**
- **Creates the Cloud Functions with custom settings, including memory, timeout, ingress, and VPC configuration.**

## Usage

### Python/.net HTTP Cloud Function

```hcl
module "http_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.http_local_folder
  folder_name                   = var.http_folder_name
  function_name                 = var.http_function_name
  runtime                       = var.http_runtime
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.http_trigger_type
  trigger_event_resource        = null
  encryption_type               = var.http_encryption_type
  description                   = var.http_description
  project_id                    = var.project_id
  zip_name                      = var.http_zip_name
  function_archive_bucket_name  = var.http_function_archive_bucket_name
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}

```

### Python/.net Pub/Sub Cloud Function

```hcl
module "pubsub_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.pubsub_local_folder
  folder_name                   = var.pubsub_folder_name
  function_name                 = var.pubsub_function_name
  runtime                       = var.pubsub_runtime
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.pubsub_trigger_type
  trigger_event_resource        = var.pubsub_trigger_event_resource
  encryption_type               = var.pubsub_encryption_type
  description                   = var.pubsub_description
  project_id                    = var.project_id
  zip_name                      = var.pubsub_zip_name
  function_archive_bucket_name  = var.pubsub_function_archive_bucket_name
  trigger_event_type_pubsub     = var.pubsub_trigger_event_type_pubsub
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre = var.cost_centre
  data_classification = var.data_classification
  environment = var.environment
}

```

### Python/.net Storage Cloud Function
```hcl
module "storage_cloud_function" {
  source                        = "../../../"
  github_url                    = var.github_url
  local_folder                  = var.storage_local_folder
  folder_name                   = var.storage_folder_name
  function_name                 = var.storage_function_name
  runtime                       = var.storage_runtime
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  entry_point                   = var.entry_point
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email
  max_instances                 = var.max_instances
  trigger_type                  = var.storage_trigger_type
  trigger_event_resource        = var.storage_trigger_event_resource
  encryption_type               = var.storage_encryption_type
  description                   = var.storage_description
  project_id                    = var.project_id
  zip_name                      = var.storage_zip_name
  function_archive_bucket_name  = var.storage_function_archive_bucket_name
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}

```

# Inputs
Name             | Description                                                         | Type   | Default | Required
-----------------|---------------------------------------------------------------------|--------|---------|---------
github_url       | The URL of the GitHub repository containing the Cloud Function code. | string | n/a     | yes
function_name    | The name of the Cloud Function.                                     | string | n/a     | yes
runtime          | The runtime environment for the Cloud Function.                     | string | n/a     | yes
trigger_type     | The trigger type for the Cloud Function.                            | string | n/a     | yes
folder_name      | The name of the local folder to clone the GitHub repository.        | string | n/a     | no
zip_name         | The name of the function code zip file.                             | string | n/a     | no
created_by       | The creator of the Cloud Function.                                  | string | n/a     | no
description      | A description of the Cloud Function.                                | string | n/a     | no
owner            | The owner of the Cloud Function.                                    | string | n/a     | no
available_memory_mb | The amount of memory available for the Cloud Function in megabytes. | number | 256   | no
timeout          | The timeout value for the Cloud Function in seconds.                | number | 60      | no
entry_point      | The entry point function within the Cloud Function code.            | string | n/a     | no
environment_vars | A map of environment variables to be set for the Cloud Function.    | map    | {}      | no
ingress_settings | The ingress settings for the Cloud Function.                        | string | ALLOW_ALL | no
vpc_connector_egress_settings | The egress settings for the VPC connector used by the Cloud Function. | string | n/a | no
vpc_connector    | The VPC connector to be used by the Cloud Function.                 | string | n/a     | no
service_account_email | The email address of the service account used by the Cloud Function. | string | n/a | no
max_instances    | The maximum number of instances for the Cloud Function.              | number | n/a    | no
trigger_event_resource | The resource associated with the event trigger.                    | string | n/a | no
encryption_type  | The encryption type for the Cloud Function.                         | string | n/a     | no
project_id       | The ID of the Google Cloud Platform project where the Cloud Function will be deployed. | string | n/a | no
function_archive_bucket_name | The name of the Google Cloud Storage bucket to store the function code archive. | string | n/a | no
trigger_event_type_pubsub | The event type for Pub/Sub trigger (only applicable if trigger_type is "pubsub"). | string | n/a | no
build_env_vars   | A map of environment variables to be set during the build process (only applicable for some runtimes). | map | {} | no
build_worker_pool | The worker pool to be used for the build process (only applicable for some runtimes). | string | n/a | no
kms_key_name     | The name of the Cloud Key Management Service (KMS) key to be used for encryption. | string | n/a | no



# Outputs
| Name         | Description                                                                                     |
|--------------|-------------------------------------------------------------------------------------------------|
| function_url | The URL of the deployed HTTP-triggered Cloud Function (only available if trigger_type is "http"). |

# Enable the appropriate APIs

- Cloud Functions API (cloudfunctions.googleapis.com): This API is required to create, manage, and deploy Cloud Functions.

- Cloud Storage API (storage.googleapis.com): This API is necessary to create and manage Google Cloud Storage buckets and objects, which are used to store the source code and other files related to the Cloud Functions.

- Pub/Sub API (pubsub.googleapis.com). This API is required to create and manage Pub/Sub topics and subscriptions.



# Requirements

A service account with the required roles 

    - roles/cloudfunctions.developer: This role allows the service account to create, update, and delete Cloud Functions.

    - roles/storage.admin: This role allows the service account to manage storage buckets and objects.

    - roles/pubsub.admin (if using Pub/Sub triggers): This role allows the service account to manage Pub/Sub topics and subscriptions.

    - roles/iam.serviceAccountUser: This role allows the service account to use the service account specified in var.service_account_email. 

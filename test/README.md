# Google Cloud Functions Terraform Module
This Terraform module deploys a Google Cloud Function from a GitHub repository. It supports both HTTP-triggered and event-triggered functions. The module clones the repository, installs necessary packages, zips the code, uploads it to a Google Cloud Storage bucket, and creates the Cloud Function.

## Features
* **Supports HTTP-triggered and event-triggered functions.**
* **Clones a GitHub repository containing the function code.**
* **Installs Python or .NET packages.**
* **Zips the function code and uploads it to a Google Cloud Storage bucket.**
* **Creates the Cloud Function with custom settings, including memory, timeout, ingress, and VPC configuration.**

## Modules

### Python HTTP Cloud Function
This module enables you to deploy HTTP-triggered Cloud Functions using Python. The function's code is cloned from a GitHub repository, packaged, and uploaded to a Google Cloud Storage bucket before the Cloud Function is created.

### Python Pub/Sub Cloud Function
This module deploys a Cloud Function that is triggered by Pub/Sub events, using Python as the runtime. The function's code is sourced from a GitHub repository, packaged, and uploaded to a Google Cloud Storage bucket prior to the Cloud Function deployment.

### Python Storage Cloud Function
With this module, you can deploy a Cloud Function triggered by Google Cloud Storage events, using Python. The function's code is cloned from a GitHub repository, packaged, and uploaded to a Google Cloud Storage bucket before deployment.

### .NET HTTP Cloud Function
This module allows you to deploy HTTP-triggered Cloud Functions using .NET. The function's code is cloned from a GitHub repository, necessary .NET packages are installed, and the code is packaged and uploaded to a Google Cloud Storage bucket. The Cloud Function is then created with your custom settings.

### .NET Pub/Sub Cloud Function
With this module, you can deploy a Cloud Function triggered by Pub/Sub events, using .NET as the runtime. The function's code is sourced from a GitHub repository, .NET packages are installed, and the code is packaged and uploaded to a Google Cloud Storage bucket prior to the Cloud Function deployment.

### .NET Storage Cloud Function
This module enables you to deploy a Cloud Function triggered by Google Cloud Storage events, using .NET. The function's code is cloned from a GitHub repository, necessary .NET packages are installed, and the code is packaged and uploaded to a Google Cloud Storage bucket. The Cloud Function is then created with your custom settings.


---

Here's how you can use these modules in your Terraform configurations:


## Python HTTP Cloud Function
### Usage
```hcl
module "http_python_cloud_function" {
  source                        = "<module-source>"
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
  encryption_type               = var.http_encryption_type_python
  description                   = var.http_description_python
  region                        = var.region
  project_id                    = var.project_id
  zip_name                      = var.http_zip_name_python
  function_archive_bucket_name  = var.http_function_archive_bucket_name_python
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}
```
<br><br>

## Inputs:
| Name                           | Description                                  | Type     | Default | Required |
| ------------------------------ | -------------------------------------------- | -------- | ------- | :------: |
| github_url                     | The GitHub URL to fetch the code from        | string   | -       |    yes   |
| local_folder                   | The local folder with the function code      | string   | -       |    yes   |
| folder_name                    | The name of the folder in the repo           | string   | -       |    yes   |
| function_name                  | The name of the cloud function               | string   | -       |    yes   |
| runtime                        | The runtime of the function                  | string   | -       |    yes   |
| available_memory_mb            | The available memory for the function        | number   | -       |    yes   |
| timeout                        | The timeout of the function                  | number   | -       |    yes   |
| entry_point                    | The entry point of the function              | string   | -       |    yes   |
| environment_vars               | The environment variables for the function   | map      | -       |    no    |
| ingress_settings               | The ingress settings for the function        | string   | -       |    no    |
| vpc_connector_egress_settings  | The egress settings for the VPC connector    | string   | -       |    no    |
| vpc_connector                  | The VPC connector for the function           | string   | -       |    no    |
| service_account_email          | The service account email for the function   | string   | -       |    no    |
| max_instances                  | The maximum instances for the function       | number   | -       |    no    |
| trigger_type                   | The trigger type for the function            | string   | -       |    yes   |
| trigger_event_resource         | The resource for the trigger event           | string   | -       |    yes   |
| encryption_type                | The encryption type for the function         | string   | -       |    no    |
| description                    | The description of the function              | string   | -       |    no    |
| region                         | The region of the function                   | string   | -       |    yes   |
| project_id                     | The project ID                               | string   | -       |    yes   |
| zip_name                       | The name of the ZIP file with the function   | string   | -       |    yes   |
| function_archive_bucket_name   | The bucket name for the function archive     | string   | -       |    yes   |
| owner                          | The owner of the function                    | string   | -       |    yes   |
| cmdb_appid                     | The CMDB application ID                      | string   | -       |    yes   |
| cost_centre                    | The cost centre for the function             | string   | -       |    yes   |
| data_classification            | The data classification                      | string   | -       |    yes   |
| environment                    | The environment (e.g. dev, test, prod)       | string   | -       |    yes   |



<br><br><br><br>




## Python Pub/Sub Cloud Function
### Usage
```hcl
module "pubsub_python_cloud_function" {
  source                        = "<module-source>"
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
  description                   = var.pubsub_description_python
  region                        = var.region
  project_id                    = var.project_id
  zip_name                      = var.pubsub_zip_name_python
  function_archive_bucket_name  = var.pubsub_function_archive_bucket_name_python
  trigger_event_type_pubsub     = var.pubsub_trigger_event_type_pubsub_python
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}
```
<br><br>

## Inputs
| Name                           | Description                                  | Type     | Default | Required |
| ------------------------------ | -------------------------------------------- | -------- | ------- | :------: |
| github_url                     | The GitHub URL to fetch the code from        | string   | -       |    yes   |
| local_folder                   | The local folder with the function code      | string   | -       |    yes   |
| folder_name                    | The name of the folder in the repo           | string   | -       |    yes   |
| function_name                  | The name of the cloud function               | string   | -       |    yes   |
| runtime                        | The runtime of the function                  | string   | -       |    yes   |
| available_memory_mb            | The available memory for the function        | number   | -       |    yes   |
| timeout                        | The timeout of the function                  | number   | -       |    yes   |
| entry_point                    | The entry point of the function              | string   | -       |    yes   |
| environment_vars               | The environment variables for the function   | map      | -       |    no    |
| ingress_settings               | The ingress settings for the function        | string   | -       |    no    |
| vpc_connector_egress_settings  | The egress settings for the VPC connector    | string   | -       |    no    |
| vpc_connector                  | The VPC connector for the function           | string   | -       |    no    |
| service_account_email          | The service account email for the function   | string   | -       |    no    |
| max_instances                  | The maximum instances for the function       | number   | -       |    no    |
| trigger_type                   | The trigger type for the function            | string   | -       |    yes   |
| trigger_event_resource         | The resource for the trigger event           | string   | -       |    yes   |
| encryption_type                | The encryption type for the function         | string   | -       |    no    |
| description                    | The description of the function              | string   | -       |    no    |
| region                         | The region of the function                   | string   | -       |    yes   |
| project_id                     | The project ID                               | string   | -       |    yes   |
| zip_name                       | The name of the ZIP file with the function   | string   | -       |    yes   |
| function_archive_bucket_name   | The bucket name for the function archive     | string   | -       |    yes   |
| owner                          | The owner of the function                    | string   | -       |    yes   |
| cmdb_appid                     | The CMDB application ID                      | string   | -       |    yes   |
| cost_centre                    | The cost centre for the function             | string   | -       |    yes   |
| data_classification            | The data classification                      | string   | -       |    yes   |
| environment                    | The environment (e.g. dev, test, prod)       | string   | -       |    yes   |

<br><br>
<br><br>

## Python Storage Cloud Function
### Usage
```hcl
module "storage_python_cloud_function" {
  source                        = "<module-source>"
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
  description                   = var.storage_description_python
  region                        = var.region
  project_id                    = var.project_id
  zip_name                      = var.storage_zip_name_python
  function_archive_bucket_name  = var.storage_function_archive_bucket_name_python
  trigger_event_type_storage    = var.storage_trigger_event_type_storage_python
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}
```

<br><br>

## Inputs
| Name                           | Description                                  | Type     | Default | Required |
| ------------------------------ | -------------------------------------------- | -------- | ------- | :------: |
| github_url                     | The GitHub URL to fetch the code from        | string   | -       |    yes   |
| local_folder                   | The local folder with the function code      | string   | -       |    yes   |
| folder_name                    | The name of the folder in the repo           | string   | -       |    yes   |
| function_name                  | The name of the cloud function               | string   | -       |    yes   |
| runtime                        | The runtime of the function                  | string   | -       |    yes   |
| available_memory_mb            | The available memory for the function        | number   | -       |    yes   |
| timeout                        | The timeout of the function                  | number   | -       |    yes   |
| entry_point                    | The entry point of the function              | string   | -       |    yes   |
| environment_vars               | The environment variables for the function   | map      | -       |    no    |
| ingress_settings               | The ingress settings for the function        | string   | -       |    no    |
| vpc_connector_egress_settings  | The egress settings for the VPC connector    | string   | -       |    no    |
| vpc_connector                  | The VPC connector for the function           | string   | -       |    no    |
| service_account_email          | The service account email for the function   | string   | -       |    no    |
| max_instances                  | The maximum instances for the function       | number   | -       |    no    |
| trigger_type                   | The trigger type for the function            | string   | -       |    yes   |
| trigger_event_resource         | The resource for the trigger event           | string   | -       |    yes   |
| encryption_type                | The encryption type for the function         | string   | -       |    no    |
| description                    | The description of the function              | string   | -       |    no    |
| region                         | The region of the function                   | string   | -       |    yes   |
| project_id                     | The project ID                               | string   | -       |    yes   |
| zip_name                       | The name of the ZIP file with the function   | string   | -       |    yes   |
| function_archive_bucket_name   | The bucket name for the function archive     | string   | -       |    yes   |
| owner                          | The owner of the function                    | string   | -       |    yes   |
| cmdb_appid                     | The CMDB application ID                      | string   | -       |    yes   |
| cost_centre                    | The cost centre for the function             | string   | -       |    yes   |
| data_classification            | The data classification                      | string   | -       |    yes   |
| environment                    | The environment (e.g. dev, test, prod)       | string   | -       |    yes   |

<br><br>
<br><br>

## .NET HTTP Cloud Function
### Usage

```hcl
module "http_dotnet_cloud_function" {
  source                        = "<module-source>"
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
  encryption_type               = var.http_encryption_type_dotnet
  description                   = var.http_description_dotnet
  region                        = var.region
  project_id                    = var.project_id
  zip_name                      = var.http_zip_name_dotnet
  function_archive_bucket_name  = var.http_function_archive_bucket_name_dotnet
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}
```

<br><br>

## Inputs
| Name                           | Description                                  | Type     | Default | Required |
| ------------------------------ | -------------------------------------------- | -------- | ------- | :------: |
| github_url                     | The GitHub URL to fetch the code from        | string   | -       |    yes   |
| local_folder                   | The local folder with the function code      | string   | -       |    yes   |
| folder_name                    | The name of the folder in the repo           | string   | -       |    yes   |
| function_name                  | The name of the cloud function               | string   | -       |    yes   |
| runtime                        | The runtime of the function                  | string   | -       |    yes   |
| available_memory_mb            | The available memory for the function        | number   | -       |    yes   |
| timeout                        | The timeout of the function                  | number   | -       |    yes   |
| entry_point                    | The entry point of the function              | string   | -       |    yes   |
| environment_vars               | The environment variables for the function   | map      | -       |    no    |
| ingress_settings               | The ingress settings for the function        | string   | -       |    no    |
| vpc_connector_egress_settings  | The egress settings for the VPC connector    | string   | -       |    no    |
| vpc_connector                  | The VPC connector for the function           | string   | -       |    no    |
| service_account_email          | The service account email for the function   | string   | -       |    no    |
| max_instances                  | The maximum instances for the function       | number   | -       |    no    |
| trigger_type                   | The trigger type for the function            | string   | -       |    yes   |
| trigger_event_resource         | The resource for the trigger event           | string   | -       |    yes   |
| encryption_type                | The encryption type for the function         | string   | -       |    no    |
| description                    | The description of the function              | string   | -       |    no    |
| region                         | The region of the function                   | string   | -       |    yes   |
| project_id                     | The project ID                               | string   | -       |    yes   |
| zip_name                       | The name of the ZIP file with the function   | string   | -       |    yes   |
| function_archive_bucket_name   | The bucket name for the function archive     | string   | -       |    yes   |
| owner                          | The owner of the function                    | string   | -       |    yes   |
| cmdb_appid                     | The CMDB application ID                      | string   | -       |    yes   |
| cost_centre                    | The cost centre for the function             | string   | -       |    yes   |
| data_classification            | The data classification                      | string   | -       |    yes   |
| environment                    | The environment (e.g. dev, test, prod)       | string   | -       |    yes   |

<br><br>
<br><br>


## .NET Pub/Sub Cloud Function
### Usage

```hcl
module "pubsub_dotnet_cloud_function" {
  source                        = "<module-source>"
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
  description                   = var.pubsub_description_dotnet
  region                        = var.region
  project_id                    = var.project_id
  zip_name                      = var.pubsub_zip_name_dotnet
  function_archive_bucket_name  = var.pubsub_function_archive_bucket_name_dotnet
  trigger_event_type_pubsub     = var.pubsub_trigger_event_type_pubsub_dotnet
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}
```
<br><br>

## Inputs
| Name                           | Description                                  | Type     | Default | Required |
| ------------------------------ | -------------------------------------------- | -------- | ------- | :------: |
| github_url                     | The GitHub URL to fetch the code from        | string   | -       |    yes   |
| local_folder                   | The local folder with the function code      | string   | -       |    yes   |
| folder_name                    | The name of the folder in the repo           | string   | -       |    yes   |
| function_name                  | The name of the cloud function               | string   | -       |    yes   |
| runtime                        | The runtime of the function                  | string   | -       |    yes   |
| available_memory_mb            | The available memory for the function        | number   | -       |    yes   |
| timeout                        | The timeout of the function                  | number   | -       |    yes   |
| entry_point                    | The entry point of the function              | string   | -       |    yes   |
| environment_vars               | The environment variables for the function   | map      | -       |    no    |
| ingress_settings               | The ingress settings for the function        | string   | -       |    no    |
| vpc_connector_egress_settings  | The egress settings for the VPC connector    | string   | -       |    no    |
| vpc_connector                  | The VPC connector for the function           | string   | -       |    no    |
| service_account_email          | The service account email for the function   | string   | -       |    no    |
| max_instances                  | The maximum instances for the function       | number   | -       |    no    |
| trigger_type                   | The trigger type for the function            | string   | -       |    yes   |
| trigger_event_resource         | The resource for the trigger event           | string   | -       |    yes   |
| encryption_type                | The encryption type for the function         | string   | -       |    no    |
| description                    | The description of the function              | string   | -       |    no    |
| region                         | The region of the function                   | string   | -       |    yes   |
| project_id                     | The project ID                               | string   | -       |    yes   |
| zip_name                       | The name of the ZIP file with the function   | string   | -       |    yes   |
| function_archive_bucket_name   | The bucket name for the function archive     | string   | -       |    yes   |
| owner                          | The owner of the function                    | string   | -       |    yes   |
| cmdb_appid                     | The CMDB application ID                      | string   | -       |    yes   |
| cost_centre                    | The cost centre for the function             | string   | -       |    yes   |
| data_classification            | The data classification                      | string   | -       |    yes   |
| environment                    | The environment (e.g. dev, test, prod)       | string   | -       |    yes   |

<br><br>
<br><br>

## .NET Storage Cloud Function
### Usage

```hcl
module "storage_dotnet_cloud_function" {
  source                        = "<module-source>"
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
  description                   = var.storage_description_dotnet
  region                        = var.region
  project_id                    = var.project_id
  zip_name                      = var.storage_zip_name_dotnet
  function_archive_bucket_name  = var.storage_function_archive_bucket_name_dotnet
  trigger_event_type_storage    = var.storage_trigger_event_type_storage_dotnet
  owner                         = var.owner
  cmdb_appid                    = var.cmdb_appid
  cost_centre                   = var.cost_centre
  data_classification           = var.data_classification
  environment                   = var.environment
}
```
<br><br>

## Inputs
| Name                           | Description                                  | Type     | Default | Required |
| ------------------------------ | -------------------------------------------- | -------- | ------- | :------: |
| github_url                     | The GitHub URL to fetch the code from        | string   | -       |    yes   |
| local_folder                   | The local folder with the function code      | string   | -       |    yes   |
| folder_name                    | The name of the folder in the repo           | string   | -       |    yes   |
| function_name                  | The name of the cloud function               | string   | -       |    yes   |
| runtime                        | The runtime of the function                  | string   | -       |    yes   |
| available_memory_mb            | The available memory for the function        | number   | -       |    yes   |
| timeout                        | The timeout of the function                  | number   | -       |    yes   |
| entry_point                    | The entry point of the function              | string   | -       |    yes   |
| environment_vars               | The environment variables for the function   | map      | -       |    no    |
| ingress_settings               | The ingress settings for the function        | string   | -       |    no    |
| vpc_connector_egress_settings  | The egress settings for the VPC connector    | string   | -       |    no    |
| vpc_connector                  | The VPC connector for the function           | string   | -       |    no    |
| service_account_email          | The service account email for the function   | string   | -       |    no    |
| max_instances                  | The maximum instances for the function       | number   | -       |    no    |
| trigger_type                   | The trigger type for the function            | string   | -       |    yes   |
| trigger_event_resource         | The resource for the trigger event           | string   | -       |    yes   |
| encryption_type                | The encryption type for the function         | string   | -       |    no    |
| description                    | The description of the function              | string   | -       |    no    |
| region                         | The region of the function                   | string   | -       |    yes   |
| project_id                     | The project ID                               | string   | -       |    yes   |
| zip_name                       | The name of the ZIP file with the function   | string   | -       |    yes   |
| function_archive_bucket_name   | The bucket name for the function archive     | string   | -       |    yes   |
| owner                          | The owner of the function                    | string   | -       |    yes   |
| cmdb_appid                     | The CMDB application ID                      | string   | -       |    yes   |
| cost_centre                    | The cost centre for the function             | string   | -       |    yes   |
| data_classification            | The data classification                      | string   | -       |    yes   |
| environment                    | The environment (e.g. dev, test, prod)       | string   | -       |    yes   |

<br><br>
<br><br>


## Outputs for all the varients 

| Name                           | Description                                  |
| ------------------------------ | -------------------------------------------- |
| function_http_url              | HTTP trigger URL for the Cloud Function      |
| function_name                  | Cloud Function name                          |
| function_service_account_email | Cloud Function service account email         |
| function_runtime               | Cloud Function runtime                       |
| function_region                | Cloud Function region                        |
| function_memory                | Cloud Function memory allocation             |
| function_project               | Cloud Function project                       |
| function_id                    | Cloud Function ID                            |
| function_vpc_egress_settings   | Cloud Function VPC egress settings           |

#  InSpec Profile For GCP

This  shows the implementation of an InSpec profile for GCP that depends on the [InSpec GCP Resource Pack](https://github.com/inspec/inspec-gcp).  See the [README](https://github.com/inspec/inspec-gcp) for instructions on setting up appropriate GCP credentials.

##  Create a profile

```
$ inspec init profile --platform gcp my-profile
Create new profile at /Users/spaterson/my-profile
 * Create directory libraries
 * Create file README.md
 * Create directory controls
 * Create file controls/example.rb
 * Create file inspec.yml
 * Create file inputs.yml
 * Create file libraries/.gitkeep

```

## Update `inputs.yml` to point to your project

```
gcp_project_id: 'my-gcp-project'
```

## Run the tests

```
$ cd gcp-profile/
$ inspec exec . -t gcp:// --input-file=inputs.yml


Profile: GCP InSpec Profile (my-profile)
Version: 0.1.0
Target:  gcp://local-service-account@my-gcp-project.iam.gserviceaccount.com

  ✔  gcp-single-region-1.0: Ensure single region has the correct properties.
     ✔  Region europe-west2 zone_names should include "europe-west2-a"
  ✔  gcp-regions-loop-1.0: Ensure regions have the correct properties in bulk.
     ✔  Region asia-east1 should be up
     ✔  Region asia-northeast1 should be up
     ✔  Region asia-south1 should be up
     ✔  Region asia-southeast1 should be up
     ✔  Region australia-southeast1 should be up
     ✔  Region europe-north1 should be up
     ✔  Region europe-west1 should be up
     ✔  Region europe-west2 should be up
     ✔  Region europe-west3 should be up
     ✔  Region europe-west4 should be up
     ✔  Region northamerica-northeast1 should be up
     ✔  Region southamerica-east1 should be up
     ✔  Region us-central1 should be up
     ✔  Region us-east1 should be up
     ✔  Region us-east4 should be up
     ✔  Region us-west1 should be up
     ✔  Region us-west2 should be up


Profile: Google Cloud Platform Resource Pack (inspec-gcp)
Version: 0.5.0
## Input Parameters

### HTTP Trigger
- `http`:
  - `description`: Description of the Cloud Function triggered by HTTP events.
  - `function_name`: Name of the Cloud Function.
  - `runtime`: Runtime environment for the Cloud Function (e.g., python39).
  - `local_folder`: Local folder path where the function code is located.
  - `folder_name`: Folder name for the Cloud Function in the GitHub repository.
  - `trigger_type`: Trigger type for the Cloud Function (in this case, "HTTP_TRIGGER").
  - `encryption_type`: Encryption type for the Cloud Function.
  - `zip_name`: Name of the function code zip file.
  - `function_archive_bucket_name`: Name of the Google Cloud Storage bucket to store the function code archive.

### Pub/Sub Trigger
- `pubsub`:
  - `description`: Description of the Cloud Function triggered by Pub/Sub events.
  - `function_name`: Name of the Cloud Function.
  - `runtime`: Runtime environment for the Cloud Function (e.g., python39).
  - `folder_name`: Folder name for the Cloud Function in the GitHub repository.
  - `trigger_type`: Trigger type for the Cloud Function (in this case, "PUBSUB_TRIGGER").
  - `trigger_event_type_pubsub`: Event type for Pub/Sub trigger ("google.pubsub.topic.publish").
  - `trigger_event_resource`: Resource associated with the Pub/Sub trigger.
  - `encryption_type`: Encryption type for the Cloud Function.
  - `zip_name`: Name of the function code zip file.
  - `function_archive_bucket_name`: Name of the Google Cloud Storage bucket to store the function code archive.
  - `local_folder`: Local folder path where the function code is located.

### Storage Trigger
- `storage`:
  - `description`: Description of the Cloud Function triggered by Storage events.
  - `function_name`: Name of the Cloud Function.
  - `runtime`: Runtime environment for the Cloud Function (e.g., python39).
  - `folder_name`: Folder name for the Cloud Function in the GitHub repository.
  - `trigger_type`: Trigger type for the Cloud Function (in this case, "BUCKET_TRIGGER").
  - `trigger_event_resource`: Resource associated with the Storage trigger.
  - `encryption_type`: Encryption type for the Cloud Function.
  - `zip_name`: Name of the function code zip file.
  - `function_archive_bucket_name`: Name of the Google Cloud Storage bucket to store the function code archive.
  - `local_folder`: Local folder path where the function code is located.

## Testing Process

1. **Terraform Deployment:**
   - The Terraform module is used to deploy the Cloud Functions based on the specified parameters.
   - The code is cloned from the GitHub repository, necessary packages are installed, and the function code is zipped.
   - The zipped code is uploaded to a Google Cloud Storage bucket.
   - The Cloud Functions are created with the custom settings provided.

2. **InSpec Testing:**
   - InSpec is a compliance testing framework used to perform infrastructure testing and compliance checks.
   - The InSpec profile is configured with the necessary parameters to test the deployed Cloud Functions.
   - InSpec tests are written to validate the deployed Cloud Functions.
   - The InSpec profile is deployed to a VM instance created by Terraform.
   - InSpec runs the tests against the infrastructure to ensure the Cloud Functions meet the defined criteria.
   - The tests validate properties such as the Cloud Function's name, runtime, status, service account email, entry point, memory, timeout, and triggers.
   - For HTTP triggers, InSpec

```

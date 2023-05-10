created_by = "serverless_team"
owner      = "serverless_team"

project_id                    = "hostproject-379219"
available_memory_mb           = 256
timeout                       = 60
entry_point                   = "main"
environment_vars              = { "EXAMPLE_VAR" = "example_value" }
ingress_settings              = "ALLOW_ALL"
vpc_connector_egress_settings = "ALL_TRAFFIC"
vpc_connector                 = "projects/hostproject-379219/locations/europe-west2/connectors/serverlessvpcconnector"
service_account_email         = "hostproject-379219@appspot.gserviceaccount.com"
max_instances                 = 10
github_url                    = ""
kms_key_name                  = null


http_description                  = "Cloud_function_triggered_by_http_events"
http_function_name                = "python_http_event_function"
http_runtime                      = "python39"
http_local_folder                 = "testdata/python-cf/"
http_folder_name                  = "ci-cd"
http_trigger_type                 = "HTTP_TRIGGER"
http_encryption_type              = ""
http_zip_name                     = "python_http_event_function"
http_function_archive_bucket_name = "cf-archive-bucket"

pubsub_description               = "Cloud_function_triggered_by_pubsub_events"
pubsub_function_name             = "python_pubsub_event_function"
pubsub_runtime                   = "python39"
pubsub_folder_name               = "ci-cd"
pubsub_trigger_type              = "PUBSUB_TRIGGER"
pubsub_trigger_event_type_pubsub = "google.pubsub.topic.publish"
pubsub_trigger_event_resource    = "projects/hostproject-379219/topics/mod-test-topic"
/* pubsub_pubsub_subscription_name     = "mod-test-pubsub-subscription" */
pubsub_encryption_type              = ""
pubsub_zip_name                     = "python_pubsub_event_function"
pubsub_function_archive_bucket_name = "cf-archive-bucket"
pubsub_local_folder                 = "testdata/python-cf/"


# Storage Event Cloud Function
storage_description                  = "Cloud_function_triggered_by_storage_events"
storage_function_name                = "python_storage_event_function"
storage_runtime                      = "python39"
storage_folder_name                  = "ci-cd"
storage_trigger_type                 = "BUCKET_TRIGGER"
storage_trigger_event_resource       = "cfeventbucket"
storage_encryption_type              = ""
storage_zip_name                     = "python_storage_event_function"
storage_function_archive_bucket_name = "cf-archive-bucket"
storage_local_folder                 = "testdata/python-cf/"


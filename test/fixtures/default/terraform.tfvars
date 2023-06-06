# General configuration
labels = {
  owner               = "harsha"
  cmdb_appid          = "dsfa23"
  cost_centre         = "324234d"
  data_classification = "limited"
  environment         = "tst"
}
project_id = "hostproject-379219"

# Common Cloud Function settings
available_memory_mb           = 256
timeout                       = 60
environment_vars              = { "type" = "cloudfunction" }
ingress_settings              = "ALLOW_ALL"
vpc_connector_egress_settings = "ALL_TRAFFIC"
vpc_connector                 = "projects/hostproject-379219/locations/europe-west2/connectors/serverlessvpcconnector"
service_account_email         = "hostproject-379219@appspot.gserviceaccount.com"
max_instances                 = 10
github_url                    = ""
kms_key_name                  = null


# Common Cloud Function settings for Python
entry_point_python = "main"
entry_point_dotnet = "dotnetcf.main"


# Cloud Function settings for Python HTTP
http_description_python                  = "Cloud_function_triggered_by_http_events_python"
http_function_name_python                = "python_http_event_function"
http_runtime_python                      = "python39"
http_local_folder_python                 = "testdata/python-cf/"
http_folder_name_python                  = "testdata/python-cf-http"
http_trigger_type_python                 = "HTTP_TRIGGER"
http_encryption_type_python              = ""
http_zip_name_python                     = "python_http_event_function"
http_function_archive_bucket_name_python = "cf-archive-bucket"

# Cloud Function settings for Python Pub/Sub
pubsub_description_python                  = "Cloud_function_triggered_by_pubsub_events_python"
pubsub_function_name_python                = "python_pubsub_event_function"
pubsub_runtime_python                      = "python39"
pubsub_folder_name_python                  = "testdata/python-cf-pubsub"
pubsub_trigger_type_python                 = "PUBSUB_TRIGGER"
pubsub_trigger_event_type_pubsub_python    = "google.pubsub.topic.publish"
pubsub_trigger_event_resource_python       = "projects/hostproject-379219/topics/mod-test-topic"
pubsub_encryption_type_python              = ""
pubsub_zip_name_python                     = "python_pubsub_event_function"
pubsub_function_archive_bucket_name_python = "cf-archive-bucket"
pubsub_local_folder_python                 = "testdata/python-cf/"

# Cloud Function settings for Python Storage
storage_description_python                  = "Cloud_function_triggered_by_storage_events_python"
storage_function_name_python                = "python_storage_event_function"
storage_runtime_python                      = "python39"
storage_folder_name_python                  = "testdata/python-cf-storage"
storage_trigger_type_python                 = "BUCKET_TRIGGER"
storage_trigger_event_resource_python       = "cfeventbucket"
storage_encryption_type_python              = ""
storage_zip_name_python                     = "python_storage_event_function"
storage_function_archive_bucket_name_python = "cf-archive-bucket"
storage_local_folder_python                 = "testdata/python-cf/"

# Cloud Function settings for Dotnet HTTP
http_description_dotnet                  = "Cloud_function_triggered_by_http_events_dotnet"
http_function_name_dotnet                = "dotnet_http_event_function"
http_runtime_dotnet                      = "dotnet6"
http_folder_name_dotnet                  = "testdata/dotnet-cf-http"
http_trigger_type_dotnet                 = "HTTP_TRIGGER"
http_encryption_type_dotnet              = ""
http_zip_name_dotnet                     = "dotnet_http_event_function"
http_function_archive_bucket_name_dotnet = "cf-archive-bucket"
http_local_folder_dotnet                 = "testdata/dotnet-cf/"

# Cloud Function settings for Dotnet Pub/Sub
pubsub_description_dotnet                  = "Cloud_function_triggered_by_pubsub_events_dotnet"
pubsub_function_name_dotnet                = "dotnet_pubsub_event_function"
pubsub_runtime_dotnet                      = "dotnet6"
pubsub_folder_name_dotnet                  = "testdata/dotnet-cf-pubsub"
pubsub_trigger_type_dotnet                 = "PUBSUB_TRIGGER"
pubsub_trigger_event_type_pubsub_dotnet    = "google.pubsub.topic.publish"
pubsub_trigger_event_resource_dotnet       = "projects/hostproject-379219/topics/mod-test-topic"
pubsub_encryption_type_dotnet              = ""
pubsub_zip_name_dotnet                     = "dotnet_pubsub_event_function"
pubsub_function_archive_bucket_name_dotnet = "cf-archive-bucket"
pubsub_local_folder_dotnet                 = "testdata/dotnet-cf/"

# Cloud Function settings for Dotnet Storage
storage_description_dotnet                  = "Cloud_function_triggered_by_storage_events_dotnet"
storage_function_name_dotnet                = "dotnet_storage_event_function"
storage_runtime_dotnet                      = "dotnet6"
storage_folder_name_dotnet                  = "testdata/dotnet-cf-storage"
storage_trigger_type_dotnet                 = "BUCKET_TRIGGER"
storage_trigger_event_resource_dotnet       = "cfeventbucket"
storage_encryption_type_dotnet              = ""
storage_zip_name_dotnet                     = "dotnet_storage_event_function"
storage_function_archive_bucket_name_dotnet = "cf-archive-bucket"
storage_local_folder_dotnet                 = "testdata/dotnet-cf/"

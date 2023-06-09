# Define the Google Cloud provider block for the Terraform configuration
provider "google" {

  # Set the project ID for the provider to a variable passed in from the module or environment
  project = var.project_id

  # Set the region for the provider to the "europe-west2" region
  region = var.region
}

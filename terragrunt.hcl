
locals {
  project  = "nap-devops-nonprod"
  region = "asia-southeast1"
}

inputs = {
  project = local.project
  region = local.region
  vpc_name  = "default"

  gce_manager_service_account = "gce-manager@${local.project}.iam.gserviceaccount.com"
  gce_rke_service_account = "gce-rke@${local.project}.iam.gserviceaccount.com"
}

################################## Common ########################################

remote_state {
 backend = "gcs" 
 config = {
   bucket = "nap-devops-nonprod-tf"
   prefix = path_relative_to_include()
   project = "${local.project}"
   location = "${local.region}"
 }
}

generate "provider" {
  path = "provider.tf"

  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "google" {
  project     = "${local.project}"
  region      = "${local.region}"
}

terraform {
  backend "gcs" {}
  required_providers {
    google = "4.10.0"
  }  
}
EOF
}

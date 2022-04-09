
locals {
  project  = "nap-devops-nonprod"
  region = "asia-southeast1"
}

inputs = {
  project = local.project
  region = local.region
  vpc_name  = "rke-demo-vpc"
  boot_disk_image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220204"

  gce_manager_service_account = "gce-manager@${local.project}.iam.gserviceaccount.com"
  gce_rke_service_account = "gce-rke@${local.project}.iam.gserviceaccount.com"

  rke_masters = [
    { seq = "01", zone = "a", ip = "10.10.100.1"},
    { seq = "02", zone = "b", ip = "10.10.100.2"},
    { seq = "03", zone = "c", ip = "10.10.100.3"}
  ]

  rke_workers = [
    { seq = "01", zone = "a", ip = "10.10.100.11"},
    { seq = "02", zone = "b", ip = "10.10.100.12"},
    { seq = "03", zone = "c", ip = "10.10.100.13"}
  ]  
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

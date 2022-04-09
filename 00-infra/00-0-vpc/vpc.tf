
resource "google_compute_network" "vpc" {
  name = var.vpc_name
  delete_default_routes_on_create = true
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "rke-demo-subnet-001" {
  name          = "rke-demo-subnet-001"
  ip_cidr_range = "10.10.1.0/24" # Make sure it is no overlaping with others
  region        = var.region
  network       = var.vpc_name
}

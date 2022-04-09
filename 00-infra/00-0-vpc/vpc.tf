
resource "google_compute_network" "vpc" {
  name = var.vpc_name
  delete_default_routes_on_create = true
  auto_create_subnetworks = false
}

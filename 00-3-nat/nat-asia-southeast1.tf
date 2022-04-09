locals {
  region = "asia-southeast1"
  prefix = var.vpc_name
}

resource "google_compute_router" "compute-router" {
  name    = "${local.prefix}-${local.region}"
  region  = "${local.region}"
  network = var.vpc_name

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "compute-router-nat" {
  name                               = "${local.prefix}-${local.region}"
  router                             = google_compute_router.compute-router.name
  region                             = google_compute_router.compute-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

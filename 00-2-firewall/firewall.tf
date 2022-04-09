resource "google_compute_firewall" "icmp-inbound" {
  name    = "icmp-allow-all"
  network = var.vpc_name
  priority = 1000

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "external-iap-inbound" {
  name    = "external-iap-inbound-allow"
  network = var.vpc_name
  priority = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}

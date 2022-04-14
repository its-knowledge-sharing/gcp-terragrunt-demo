resource "google_compute_route" "route-to-internet" {
  name        = "route-to-internet"
  dest_range  = "0.0.0.0/0"
  network     = var.vpc_name
  next_hop_gateway = "default-internet-gateway"
  
  priority    = 100
}

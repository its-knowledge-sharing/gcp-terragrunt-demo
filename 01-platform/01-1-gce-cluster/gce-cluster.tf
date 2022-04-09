module "rke-master" {
  for_each = toset(var.rke_masters)

  source          = "../../modules/gce"

  vm_name         = "rke-master"
  vm_sequence     = "${each.value.seq}"
  vm_tags         = ["rke-master"]
  vm_service_account = var.gce_rke_service_account
  boot_disk_image  = var.boot_disk_image
  vm_machine_type  = "e2-small"
  vm_zone          = "${var.region}-${each.value.zone}"
  vm_user          = "devops"
  vm_subnet        = var.vpc_name
  vm_ext_disk_size = 100 # 100GB
  project = var.project
  startup_script_path = "scripts/startup.bash"
}

/*
module "rke-worker" {
  source          = "../../modules/gce"

  vm_name         = "rke-worker"
  vm_sequence     = "${each.seq}"
  vm_tags         = ["rke-worker"]
  vm_service_account = var.gce_rke_service_account
  boot_disk_image  = var.boot_disk_image
  vm_machine_type  = "e2-small"
  vm_zone          = "${var.region}-${each.zone}"
  vm_user          = "devops"
  vm_subnet        = var.vpc_name
  vm_ext_disk_size = 100 # 100GB
  project = var.project
  startup_script_path = "scripts/startup.bash"
}
*/
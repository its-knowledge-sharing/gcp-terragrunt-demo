module "rke-manager-1" {
  source          = "../modules/gce"

  vm_name         = "rke-manager"
  vm_sequence     = "00"
  vm_tags         = ["rke-manager"]
  vm_service_account = var.gce_manager_service_account
  boot_disk_image  = var.boot_disk_image
  vm_machine_type  = "e2-small"
  vm_zone          = "${var.region}-a"
  vm_user          = "devops"
  vm_subnet        = "rke-demo-subnet-001"
  vm_ext_disk_size = 100 # 100GB
  project = var.project
  startup_script_path = "scripts/startup.bash"
  private_ip       = var.rke_manager_ip
}

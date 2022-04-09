module "rke-manager-1" {
  source          = "../modules/gce"

  vm_name         = "rke-manager"
  vm_sequence     = "00"
  vm_tags         = ["rke-manager"]
  vm_service_account = var.gce_manager_service_account
  boot_disk_image  = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220204"
  vm_machine_type  = "e2-small"
  vm_zone          = "${var.region}-a"
  vm_user          = var.vpc_name
  vm_subnet        = "default"
  vm_ext_disk_size = 100 # 100GB
  project = var.project
  startup_script_path = "scripts/startup.bash"
}

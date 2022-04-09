
module "gce" {
  source          = "git::https://github.com/its-software-services-devops/tf-module-gcp-vm.git//modules?ref=1.0.16"
  compute_name    = var.vm_name
  compute_seq     = var.vm_sequence
  vm_tags         = var.vm_tags
  vm_service_account = var.vm_service_account
  boot_disk_image  = var.boot_disk_image
  public_key_file  = "public-key/id_rsa.pub"
  vm_machine_type  = var.vm_machine_type
  vm_machine_zone  = var.vm_zone
  vm_deletion_protection = false
  startup_script_local_path = var.startup_script_path
  ssh_user         = var.vm_user
  create_nat_ip    = false
  user_data_path   = "scripts/cloud-init.yaml"
  external_disks   = []
  network_configs  = [{index = 1, network = var.vm_subnet, nat_ip = "", network_ip = var.private_ip}]
}

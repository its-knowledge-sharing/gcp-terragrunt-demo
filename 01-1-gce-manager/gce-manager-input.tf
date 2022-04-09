
variable "gce_manager_service_account" {
  type = string
  nullable = false 
}

variable "project" {
  type     = string
  nullable = true
  default = ""
}

variable "region" {
  type     = string
  nullable = true
  default = ""
}

variable "vpc_name" {
  type     = string
  nullable = false 
}

variable "rke_manager_ip" {
  type     = string
  nullable = false 
}

variable "boot_disk_image" {
  type     = string
  nullable = false 
}

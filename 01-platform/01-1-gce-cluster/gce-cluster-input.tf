
variable "gce_rke_service_account" {
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

variable "boot_disk_image" {
  type     = string
  nullable = false 
}

variable "rke_masters" {
  type = list(object({
    seq   = string
    zone  = string
    ip    = string
  }))
}

variable "rke_workers" {
  type = list(object({
    seq   = string
    zone  = string
    ip    = string
  }))
}

variable "vm_zone" {
  type     = string
  nullable = false 
}

variable "vm_ext_disk_size" {
  type     = number
  nullable = false 
}

variable "vm_sequence" {
  type     = string
  nullable = false 
}

variable "vm_name" {
  type     = string
  nullable = false 
}

variable "vm_subnet" {
  type     = string
  nullable = false 
}

variable "vm_user" {
  type     = string
  nullable = false 
}

variable "vm_machine_type" {
  type     = string
  nullable = false 
}

variable "boot_disk_image" {
  type     = string
  nullable = false 
}

variable "vm_tags" {
  type     = list
  nullable = false 
}

variable "vm_service_account" {
  type     = string
  nullable = true
  default = ""
}

variable "project" {
  type     = string
  nullable = true
  default = ""
}

variable "startup_script_path" {
  type     = string
  nullable = true
  default = ""
}
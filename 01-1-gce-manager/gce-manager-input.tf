
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

dependency "00-1-sa" {
  config_path = "../00-1-sa"
  skip_outputs = true
}

include "root" {
  path = find_in_parent_folders()
}

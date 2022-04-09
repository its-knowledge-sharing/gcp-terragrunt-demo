resource "google_service_account" "gce_sa_manager" {
  account_id   = "gce-manager"
  display_name = "Terraform - GCE service account for manager VM"
}

resource "google_project_iam_member" "gce_sa_manager_storage_admin" {
  project = var.project
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.gce_sa_manager.email}"
}

###

resource "google_service_account" "gce_sa_rke" {
  account_id   = "gce-rke"
  display_name = "Terraform - GCE service account for RKE"
}

#resource "google_project_iam_member" "gce_sa_rke_storage_admin" {
#  project = var.project
#  role    = "roles/storage.objectAdmin"
#  member  = "serviceAccount:${google_service_account.gce_sa_rke_storage_admin.email}"
#}

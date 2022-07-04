# create service account
resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  display_name = "${var.service_account_name} SA"
  depends_on   = [google_project_service.enabled_apis]
}

#  add needed role to service account
resource "google_project_iam_member" "service_account_roles" {
  role       = "roles/owner"
  project    = var.gcp_project_id
  member     = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [google_service_account.service_account]
}

# create key for service account
resource "google_service_account_key" "service_account_key" {
  service_account_id = var.service_account_name
  public_key_type    = "TYPE_X509_PEM_FILE"
  depends_on         = [google_project_iam_member.service_account_roles]
}
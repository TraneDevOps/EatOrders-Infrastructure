####service account for GHA####
# create service account for GHA
resource "google_service_account" "gha_service_account" {
  account_id   = var.gha_service_account_name
  display_name = "${var.gha_service_account_name} SA"
  depends_on   = [google_project_service.enabled_apis]
}

#  add needed role to GHA service account
resource "google_project_iam_member" "gha_service_account_roles" {
  role       = "roles/owner"
  project    = var.gcp_project_id
  member     = "serviceAccount:${google_service_account.gha_service_account.email}"
  depends_on = [google_service_account.gha_service_account]
}

# create key for GHA service account
resource "google_service_account_key" "gha_service_account_key" {
  service_account_id = var.gha_service_account_name
  public_key_type    = "TYPE_X509_PEM_FILE"
  depends_on         = [google_project_iam_member.gha_service_account_roles]
}

####service account for cloud sql with cloud admin role#####
# create service account for receiver-microservice
resource "google_service_account" "cloud_sql_proxy_service_account" {
  account_id   = var.cloud_sql_proxy_service_account_name
  display_name = "${var.cloud_sql_proxy_service_account_name} SA"
  depends_on   = [google_project_service.enabled_apis]
}

#  add needed role to receiver-microservice service account
resource "google_project_iam_member" "cloud_sql_proxy_service_account_roles" {
  role       = "roles/cloudsql.admin"
  project    = var.gcp_project_id
  member     = "serviceAccount:${google_service_account.cloud_sql_proxy_service_account.email}"
  depends_on = [google_service_account.cloud_sql_proxy_service_account]
}
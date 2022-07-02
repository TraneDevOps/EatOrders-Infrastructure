//create service account
resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  display_name = "${var.service_account_name} SA"
  depends_on   = [google_project_service.enabled_apis]
}

// add needed role to service account
resource "google_project_iam_member" "service_account_roles" {
  role       = "roles/owner"
  member     = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [google_service_account.service_account]
}


resource "google_service_account_key" "service_account_key" {
  service_account_id = var.service_account_name
  public_key_type    = "TYPE_X509_PEM_FILE"
  depends_on         = [google_project_iam_member.service_account_roles]
}

# resource "github_actions_secret" "gh_infra_sa_key" {
#   repository      = "EatOrders-Infrastructure"
#   secret_name     = "gcp"
#   plaintext_value = google_service_account_key.service_account_key.private_key
#   depends_on      = [google_service_account_key.service_account_key]
# }

# resource "github_actions_secret" "gh_ms_sa_key" {
#   repository      = "EatOrders-Microservices"
#   secret_name     = "gcp"
#   plaintext_value = google_service_account_key.service_account_key.private_key
#   depends_on      = [google_service_account_key.service_account_key]
# }


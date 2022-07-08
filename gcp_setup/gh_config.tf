# add service-accounts key as GitHub secrets in both repos
resource "github_actions_secret" "gh_ms_sa_key" {
  repository      = var.gh_microservices_repo
  secret_name     = var.gh_secret_name
  plaintext_value = google_service_account_key.service_account_key.private_key
  depends_on      = [google_service_account_key.fha_service_account_key]
}


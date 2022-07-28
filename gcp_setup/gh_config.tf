# add service-accounts key as GitHub secrets in both repos
resource "github_actions_secret" "gh_ms_sa_key" {
  repository      = var.gh_microservices_repo
  secret_name     = var.gh_secret_name
  plaintext_value = google_service_account_key.gha_service_account_key.private_key
  depends_on      = [google_service_account_key.gha_service_account_key]
}

data "github_repository" "repo" {
  full_name = "TraneDevOps/EatOrders-Microservices"
}

# resource "github_dependabot_organization_secret" "gh_dependabot_ms_sa_key" {
#   secret_name             = var.gh_secret_name
#   visibility              = "selected"
#   plaintext_value         = google_service_account_key.gha_service_account_key.private_key
#   selected_repository_ids = [data.github_repository.repo.repo_id]
#   depends_on              = [google_service_account_key.gha_service_account_key]
# }


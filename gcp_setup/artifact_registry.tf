resource "google_artifact_registry_repository" "artifact_repo_microservices" {
  provider = google-beta

  location = var.region
  repository_id = var.artifact_repo_name
  format = "DOCKER"
}
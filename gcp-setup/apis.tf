# activate all necessary APIs in GCP
resource "google_project_service" "serviceusage_api" {
  service                    = "serviceusage.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
}

resource "google_project_service" "servicenetworking_api" {
  service                    = "servicenetworking.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
  depends_on                 = [google_project_service.serviceusage_api]
}
resource "google_project_service" "compute_api" {
  service                    = "compute.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
  depends_on                 = [google_project_service.serviceusage_api]
}
resource "google_project_service" "container_api" {
  service                    = "container.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
  depends_on                 = [google_project_service.compute_api]
}

resource "google_project_service" "iam_api" {
  service                    = "iam.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
  depends_on                 = [google_project_service.container_api]
}

resource "google_project_service" "sql_api" {
  service                    = "sqladmin.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
  depends_on                 = [google_project_service.iam_api]
}

resource "google_project_service" "enabled_apis" {
  service                    = "redis.googleapis.com"
  disable_on_destroy         = false
  disable_dependent_services = false
  project                    = var.gcp_project_id
  depends_on                 = [google_project_service.sql_api]
}


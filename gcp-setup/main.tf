terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.90.0"
    }
    # github = {
    #   source  = "integrations/github"
    #   version = "4.19.0"
    # }
  }
  backend "gcs" {
    bucket = "tf_infrastructure"
    prefix = "gcp-setup"
  }
}

provider "google" {
  project = var.gcp_project_id
}

# provider "github" {
#   token = var.gh_token
# }


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.25.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.26.0"
    }
  }
  backend "gcs" {
    bucket = "tf_infrastructure"
    prefix = "gcp-setup"
  }
}

provider "google" {
  project = var.gcp_project_id
}

provider "github" {
  token = var.gh_token
}


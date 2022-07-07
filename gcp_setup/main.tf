# provider setupxx
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.27.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.27.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.26.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.6.0"
    }
  }
  backend "gcs" {}
}

provider "google-beta" {
  project = var.gcp_project_id
}

provider "google" {
  project = var.gcp_project_id
}

provider "github" {
  token = var.gh_token
}
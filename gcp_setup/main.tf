# provider setupxx
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.25.0"
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
  backend "gcs" {
    prefix = "tf_infrastructure"
  }
}

provider "google" {
  project = var.gcp_project_id
}

provider "github" {
  token = var.gh_token
}
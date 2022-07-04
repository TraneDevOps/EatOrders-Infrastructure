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
    bucket = "tf_infrastructure"
    prefix = "gcp_setup"
  }
}

provider "google" {
  project = var.gcp_project_id
}

provider "github" {
  token = var.gh_token
}

data "google_client_config" "default" {}
provider "helm" {
  kubernetes {
    host                   = "https://${module.gke-cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke-cluster.ca_certificate)
  }
}
#x
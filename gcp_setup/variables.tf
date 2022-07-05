# General
variable "gcp_project_id" {
  type        = string
  description = "GCP project name"
}

variable "location" {
  type        = string
  description = "location for everything"
}

variable "region" {
  type        = string
  description = "region for everything"
}

variable "zone" {
  type        = string
  description = "zone for everything"
}

variable "gh_token" {
  type        = string
  description = "GitHub PAT"
  sensitive   = true
}

variable "service_account_name" {
  type        = string
  description = "name of service account"
}

variable "cluster_name" {
  type        = string
  description = "Nnme for the new GKE cluster"
}

# VPC
variable "vpc_name" {
  type        = string
  description = "name for the VPC"
}

variable "vpc_subnet_name" {
  type        = string
  description = "name for the VPC subnet"
}

# GKE cluster
variable "gke_ip_range_name_pods" {
  type        = string
  description = "name for the alias IP range for GKE pods"
}

variable "gke_ip_range_name_services" {
  type        = string
  description = "name for the alias IP range for GKE services"
}

# Redis
variable "redis_name" {
  type        = string
  description = "name of the redis instance"
}

# Cloud SQL
variable "db_instance_name" {
  type        = string
  description = "name of Cloud SQL db instance"
}

variable "db_name" {
  type        = string
  description = "name of Cloud SQL database"
}

# buckets
variable "microservices_bucket" {
  type        = string
  description = "name of the Terraform microservices bucket"
}
#GitHub repo secrets
variable "gh_microservices_repo" {
  type        = string
  description = "name of the microservices GitHub repo"
}

variable "gh_infrastructure_repo" {
  type        = string
  description = "name of the infrastructure GitHub repo"
}

variable "gh_secret_name" {
  type        = string
  description = "name of the GitHub secret to enter GCP"
}

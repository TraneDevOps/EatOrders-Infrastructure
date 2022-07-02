# General
variable "gcp_project_id" {
  type        = string
  description = "GCP project name"
}

variable "region" {
  type        = string
  description = "Region for everything"
}

variable "zone" {
  type        = string
  description = "Zone for everything"
}

variable "gh_token" {
  type        = string
  description = "GitHub_PAT"
  sensitive   = true
}

variable "service_account_name" {
  type        = string
  description = "Name of service account"
}

variable "cluster_name" {
  type        = string
  description = "Name for the new GKE cluster"
}

# VPC
variable "vpc_name" {
  type        = string
  description = "Name for the VPC"
}

variable "vpc_subnet_name" {
  type        = string
  description = "Name for the VPC subnet"
}

variable "gke_ip_range_name_pods" {
  type        = string
  description = "Name for the alias IP range for GKE pods"
}

variable "gke_ip_range_name_services" {
  type        = string
  description = "Name for the alias IP range for GKE services"
}


# Cloud SQL
variable "db_instance_name" {
  type        = string
  description = "Name of CLoud SQL db instance"
}

variable "db_name" {
  type        = string
  description = "Name of Cloud SQL database"
}

variable "redis_name" {
  type        = string
  description = "Name of the redis instance"
  sensitive   = true
}





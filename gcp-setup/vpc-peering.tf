# Set up VPC peering for Cloud SQL

locals {
  network_id = format("%s/%s/%s/%s/%s", "projects", var.gcp_project_id, "global", "networks", var.vpc_name)
}

resource "google_compute_global_address" "vpc_peering_ip_range" {
  name          = "cloud-sql-peering"
  project       = var.gcp_project_id
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = local.network_id
  depends_on    = [module.vpc, google_project_service.enabled_apis]
}

# allow google services to use peering range with existing VPC
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = local.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.vpc_peering_ip_range.name]
  depends_on              = [google_compute_global_address.vpc_peering_ip_range, google_project_service.enabled_apis]
}

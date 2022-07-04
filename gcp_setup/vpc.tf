module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.1.0"

  project_id   = var.gcp_project_id
  network_name = var.vpc_name

  subnets = [
    {
      subnet_name   = var.vpc_subnet_name
      subnet_region = var.region
      subnet_ip     = "10.10.0.0/24"
    }
  ]

  secondary_ranges = {
    (var.vpc_subnet_name) = [
      {
        range_name    = var.gke_ip_range_name_pods
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = var.gke_ip_range_name_services
        ip_cidr_range = "10.30.0.0/16"
      }
    ]
  }

  depends_on = [google_project_service.enabled_apis]
}

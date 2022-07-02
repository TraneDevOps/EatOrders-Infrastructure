
# # # Set up GKE cluster
# module "gke-cluster" {
#   source  = "terraform-google-modules/kubernetes-engine/google"
#   version = "~> 18.0.0"

#   name                     = var.cluster_name
#   project_id               = var.gcp_project_id
#   region                   = var.region
#   network                  = var.vpc_name
#   subnetwork               = var.vpc_subnet_name
#   ip_range_pods            = var.gke_ip_range_name_pods
#   ip_range_services        = var.gke_ip_range_name_services
#   create_service_account   = true
#   remove_default_node_pool = true
#   grant_registry_access    = true
#   depends_on               = [module.vpc, google_project_service.enabled_apis]
#   # node_pools_oauth_scopes = {
#   #   "all" = [
#   #     // "View and manage your data across Google Cloud Platform services"
#   #     "https://www.googleapis.com/auth/cloud-platform",
#   #     // "View and manage your Google Compute Engine resources"
#   #     "https://www.googleapis.com/auth/compute",
#   #     // "Manage your data and permissions in Google Cloud Storage"
#   #     "https://www.googleapis.com/auth/devstorage.full_control",
#   #     // "Manage your Google API service configuration"
#   #     "https://www.googleapis.com/auth/service.management",
#   #     // "Admission control and telemetry reporting for services integrated with Service Infrastructure"
#   #     "https://www.googleapis.com/auth/servicecontrol",
#   #     // "Submit log data for your projects"
#   #     "https://www.googleapis.com/auth/logging.write",
#   #     // "View and write monitoring data for all your Google and third-party Cloud and API projects"
#   #     "https://www.googleapis.com/auth/monitoring",
#   #   ]
#   # }

# }

# Set up GKE cluster
module "gke-cluster" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 21.0.0"

  name                     = var.cluster_name
  project_id               = var.gcp_project_id
  region                   = var.region
  network                  = var.vpc_name
  subnetwork               = var.vpc_subnet_name
  ip_range_pods            = var.gke_ip_range_name_pods
  ip_range_services        = var.gke_ip_range_name_services
  create_service_account   = true
  remove_default_node_pool = true
  grant_registry_access    = true
  depends_on               = [module.vpc, google_project_service.enabled_apis]
}
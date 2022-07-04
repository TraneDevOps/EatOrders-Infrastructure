# set up redis database
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "~> 4.3.0"

  name                    = var.redis_name
  project                 = var.gcp_project_id
  memory_size_gb          = 1
  tier                    = "BASIC"
  region                  = var.region
  authorized_network      = var.vpc_name
  transit_encryption_mode = "DISABLED"
  depends_on              = [google_project_service.enabled_apis]
}

# add redis ip as configMap in gke
resource "helm_release" "redis_ip" {
  name    = "redis-ip"
  version = "2.1.2"
  chart   = "./helm/redis_ip"
  set {
    name  = "redis_ip"
    value = module.memorystore.host
  }
}

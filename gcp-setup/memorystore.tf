# module "memorystore" {
#   source                  = "terraform-google-modules/memorystore/google"
#   name                    = var.redis_name
#   project                 = var.gcp_project_id
#   memory_size_gb          = 1
#   tier                    = "BASIC"
#   region                  = var.region
#   authorized_network      = var.vpc_name
#   transit_encryption_mode = "DISABLED"
#   depends_on = [google_project_service.enabled_apis]
# } 
# data "google_client_config" "default" {}

# provider "helm" {
#     kubernetes {
#         host                   = "https://${module.gke-cluster.endpoint}"
#         token                  = data.google_client_config.default.access_token
#         cluster_ca_certificate = base64decode(module.gke-cluster.ca_certificate)
#     }
# }

# resource "helm_release" "redis_ip" {
#   name    = "redis-ip"
#   chart   = "./helm/redis_ip"
#   version = "2.1.2"
#   set{
#       name = "redis_ip"
#       value = module.memorystore.host
#   }
# }

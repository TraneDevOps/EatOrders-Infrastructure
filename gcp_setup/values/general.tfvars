# General
location                            = "eu"
region                              = "europe-west3"
zone                                = "europe-west3-a"
gha_service_account_name            = "gha-sa"
cloud_sql_proxy_service_account_name  = "cloud-sql-proxy-sa"

# VPC
vpc_name                   = "one-vpc-for-all"
vpc_subnet_name            = "one-vpc-for-all-subnet"
gke_ip_range_name_pods     = "cluster-subnet-pods"
gke_ip_range_name_services = "cluster-subnet-services"

# GKE cluster
cluster_name = "cluster"

# Redis
redis_name = "redis-queue"

# Artifact registry 
artifact_repo_name = "microservices"

# Cloud SQL
db_instance_name = "eat-orders14" #change
db_name          = "eat-orders"


#GitHub repo secrets
gh_microservices_repo  = "EatOrders-Microservices"
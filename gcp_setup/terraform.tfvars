# General
gcp_project_id       = "eatorders1"
location             = "eu"
region               = "europe-west3"
zone                 = "europe-west3-a"
service_account_name = "gha-sa"

# VPC
vpc_name                   = "vpc"
vpc_subnet_name            = "vpc-subnet"
gke_ip_range_name_pods     = "cluster-subnet-pods"
gke_ip_range_name_services = "cluster-subnet-services"

# GKE cluster
cluster_name = "cluster"

# Redis
redis_name = "redis-queue"

# Cloud SQL
db_instance_name = "eat-orders4"
db_name          = "eat_orders"

#buckets
microservices_bucket = "tf_microservices"

#GitHub repo secrets
gh_infrastructure_repo = "EatOrders-Infrastructure"
gh_microservices_repo  = "EatOrders-Microservices"
gh_secret_name         = "gha_sa"
# General
location             = "eu"
region               = "europe-west3"
zone                 = "europe-west3-a"
service_account_name = "gha-sa"

# VPC
vpc_name                   = "one-vpc-for-all"
vpc_subnet_name            = "one-vpc-for-all-subnet"
gke_ip_range_name_pods     = "cluster-subnet-pods"
gke_ip_range_name_services = "cluster-subnet-services"

# GKE cluster
cluster_name = "cluster"

# Redis
redis_name = "redis-queue"

# Cloud SQL
db_instance_name = "eat-orders11" #change
db_name          = "eat-orders"


#GitHub repo secrets
gh_infrastructure_repo = "EatOrders-Infrastructure"
gh_microservices_repo  = "EatOrders-Microservices"
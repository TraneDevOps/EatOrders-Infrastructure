# General
gcp_project_id       = "eatorders1"
region               = "europe-west3"
zone                 = "europe-west3-a"
service_account_name = "terraform-sa"

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
db_instance_name = "eat-orders2"
db_name          = "eat_orders"
#db_password         =

#gh_token =

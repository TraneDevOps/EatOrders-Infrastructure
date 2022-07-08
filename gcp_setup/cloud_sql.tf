
# set up Cloud SQL
module "sql-db" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "~> 11.0.0"

  project_id          = var.gcp_project_id
  name                = var.db_instance_name
  database_version    = "POSTGRES_13"
  region              = var.region
  zone                = var.zone
  availability_type   = "ZONAL"
  disk_autoresize     = true
  disk_size           = 10
  disk_type           = "PD_HDD"
  create_timeout      = "20m"
  delete_timeout      = "20m"
  update_timeout      = "20m"
  deletion_protection = false
  ip_configuration = {
    ipv4_enabled        = false
    private_network     = format("%s/%s/%s/%s/%s", "projects", var.gcp_project_id, "global", "networks", var.vpc_name)
    require_ssl         = false
    authorized_networks = []
    allocated_ip_range  = null
  }
  db_name        = var.db_name
  database_flags = [{ name = "cloudsql.iam_authentication", value = "on" }]
  depends_on     = [module.vpc, google_service_networking_connection.private_vpc_connection, google_project_service.enabled_apis]
}

resource "google_sql_user" "sql_iam_user" {
  name            = format("%s@%s.iam", var.microservices_service_account_name, var.gcp_project_id)
  instance        = var.db_instance_name
  type            = "CLOUD_IAM_SERVICE_ACCOUNT"
  project         = var.gcp_project_id
  deletion_policy = "ABANDON"
  depends_on      = [module.sql-db, google_service_account.microservices_service_account]
}


# create bucket for terraform setup for microservices
resource "google_storage_bucket" "tf_microservices_bucket" {
  name                        = var.microservices_bucket
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}

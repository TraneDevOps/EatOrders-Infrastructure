
resource "google_storage_bucket" "tf_microservices_bucket" {
  name          = "tf_microservices"
  location      = "EU"
  force_destroy = true
}

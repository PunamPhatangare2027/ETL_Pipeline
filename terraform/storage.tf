resource "google_storage_bucket" "raw_bucket" {
  name                        = var.raw_bucket_name
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "temp_bucket" {
  name                        = var.temp_bucket_name
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

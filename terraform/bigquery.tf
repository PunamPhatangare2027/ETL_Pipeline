resource "google_bigquery_dataset" "datasets" {
  for_each   = toset(var.dataset_ids)
  dataset_id = each.value
  location   = var.location

  delete_contents_on_destroy = true
}

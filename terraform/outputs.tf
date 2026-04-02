output "project_id" {
  value = var.project_id
}

output "raw_bucket_name" {
  value = google_storage_bucket.raw_bucket.name
}

output "temp_bucket_name" {
  value = google_storage_bucket.temp_bucket.name
}

output "service_account_email" {
  value = google_service_account.etl_sa.email
}

output "dataset_ids" {
  value = [for ds in google_bigquery_dataset.datasets : ds.dataset_id]
}

output "pubsub_topic" {
  value = google_pubsub_topic.etl_topic.name
}

output "pubsub_subscription" {
  value = google_pubsub_subscription.etl_subscription.name
}

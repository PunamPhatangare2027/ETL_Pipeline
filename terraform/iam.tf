locals {
  service_account_email = google_service_account.etl_sa.email

  project_roles = [
    "roles/dataflow.worker",
    "roles/dataflow.admin",
    "roles/storage.admin",
    "roles/bigquery.admin",
    "roles/pubsub.editor",
    "roles/logging.viewer",
    "roles/monitoring.viewer"
  ]
}

resource "google_project_iam_member" "etl_sa_roles" {
  for_each = toset(local.project_roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${local.service_account_email}"
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "location" {
  description = "Location for GCS and BigQuery"
  type        = string
  default     = "US"
}

variable "raw_bucket_name" {
  description = "Raw bucket name"
  type        = string
}

variable "temp_bucket_name" {
  description = "Temporary bucket name"
  type        = string
}

variable "service_account_id" {
  description = "Service account id"
  type        = string
  default     = "etl-pipeline-sa"
}

variable "service_account_display_name" {
  description = "Service account display name"
  type        = string
  default     = "ETL Pipeline Service Account"
}

variable "dataset_ids" {
  description = "BigQuery dataset ids"
  type        = list(string)
  default     = ["raw_devdb", "gold_devdb", "audit_devdb"]
}

variable "pubsub_topic_name" {
  description = "Pub/Sub topic"
  type        = string
  default     = "etl-topic"
}

variable "pubsub_subscription_name" {
  description = "Pub/Sub subscription"
  type        = string
  default     = "etl-subscription"
}
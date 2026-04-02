project_id                   = "caramel_id202729"
region                       = "us-central1"
location                     = "US"

raw_bucket_name              = "caramel-raw-bucket-202729"
temp_bucket_name             = "caramel-temp-bucket-202729"

service_account_id           = "etl-pipeline-sa"
service_account_display_name = "ETL Pipeline Service Account"

dataset_ids                  = ["raw_devdb", "gold_devdb", "audit_devdb"]

pubsub_topic_name            = "etl-topic"
pubsub_subscription_name     = "etl-subscription"
resource "google_pubsub_topic" "etl_topic" {
  name = var.pubsub_topic_name
}

resource "google_pubsub_subscription" "etl_subscription" {
  name  = var.pubsub_subscription_name
  topic = google_pubsub_topic.etl_topic.name

  ack_deadline_seconds = 20
}

# Define Variable based on TF_VAR environment variable set
variable "GOOGLE_CLOUD_PROJECT" {
    type        = string
    description = "Google CLoud Project to Deploy to. It must be set as an environment variable: TF_VAR_GOOGLE_CLOUD_PROJECT"
}

# Configure GCP project
provider "google" {
  project = var.GOOGLE_CLOUD_PROJECT
}

# Deploy image to Cloud Run
resource "google_cloud_run_service" "google-sentiment-analysis-webapp" {
  name     = "google-sentiment-analysis-webapp"
  location = "us-central1"
  template {
    spec {
      containers {
        image = "gcr.io/${var.GOOGLE_CLOUD_PROJECT}/google-sentiment-analysis-webapp"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Enable public access on Cloud Run service
resource "google_cloud_run_service_iam_member" "allUsers" {
  location    = google_cloud_run_service.google-sentiment-analysis-webapp.location
  project     = google_cloud_run_service.google-sentiment-analysis-webapp.project
  service     = google_cloud_run_service.google-sentiment-analysis-webapp.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
# Return service URL
output "url" {
  value = google_cloud_run_service.google-sentiment-analysis-webapp.status[0].url
}

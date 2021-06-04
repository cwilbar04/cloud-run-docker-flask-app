# Configure Terraform Cloud Backend
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "CWILBAR"

    workspaces {
      prefix = "cloud-run-docker-flask-app-"
    }
  }
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}
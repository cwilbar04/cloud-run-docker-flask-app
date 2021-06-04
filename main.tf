# Configure Terraform Cloud Backend
# terraform {
#   backend "remote" {
#     # The name of your Terraform Cloud organization.
#     organization = "CWILBAR"

#     # The name of the Terraform Cloud workspace to store Terraform state files in.
#     workspaces {
#       prefix = "cloud-run-docker-flask-app-"
#     }
#   }
# }

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
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
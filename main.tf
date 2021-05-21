# Configure Terraform Cloud Backend
terraform{
    backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "CWILBAR"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
        name = "cloud-run-docker-flask-app"
    }
    }s
}
## Simple Flask Container Webapp Deployed to Cloud Run

Requirements:
- Install and Run [Docker](https://docs.docker.com/get-docker/)
- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- Install [Make](http://gnuwin32.sourceforge.net/packages/make.htm) if running on Windows
- Create [GCP Project](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
- Enable [Container Registry API](https://cloud.google.com/container-registry/docs/quickstart)
- Enable [Cloud Run Admin API](https://cloud.google.com/run/docs/reference/rest)
- Enable [Cloud Natural Language API](https://cloud.google.com/natural-language)
  
Instructions:
1. Set environment variable TF_VAR_GOOGLE_CLOUD_PROJECT
Windows Powershell:
```cmd
$Env:TF_VAR_GOOGLE_CLOUD_PROJECT = "simple-webapp-313702"
```
2. Clone repository and navigate to directory
```cmd
git clone https://github.com/cwilbar04/cloud-run-docker-flask-app.git
cd "CLOUD RUN DOCKER FLASK APP"
```
3. Create auth connection to Google using account used to create project
```cmd
gcloud auth login
```
4. Run Make Command Build and Push Container and Deploy to Cloud Run with Terraform
```cmd
make webapp
```
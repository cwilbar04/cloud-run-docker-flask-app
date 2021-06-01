# set_project:
# 	$Env:GOOGLE_CLOUD_PROJECT = "simple-webapp-313702"

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	cd tests
	python -m pytest -vv
	terraform fmt -check

lint:
	python -m pylint --disable=R,C tests webapp

venv_create: 
	python -m venv ..\.venv

venv_activate:
	.\..\.venv\Scripts\activate

venv: venv_create venv_activate

container_build:
	docker build -t google-sentiment-analysis-webapp .

container_push_gcr:
	docker tag google-sentiment-analysis-webapp:latest gcr.io/${TF_VAR_GOOGLE_CLOUD_PROJECT}/google-sentiment-analysis-webapp:latest
	docker push gcr.io/${TF_VAR_GOOGLE_CLOUD_PROJECT}/google-sentiment-analysis-webapp:latest

container_push_dockerhub:
	docker tag google-sentiment-analysis-webapp:latest cwilbar04/google-sentiment-analysis-webapp:latest
	docker push cwilbar04/google-sentiment-analysis-webapp:latest

container_terraform:
	terraform init
	terraform apply -auto-approve

webapp: container_build container_push container_terraform

all: install lint test
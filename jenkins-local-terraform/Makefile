.PHONY: build

build:
	docker build . --tag jenkins-local:latest

.PHONY: init

init:
	cd tf/ && terraform init

.PHONY: deploy

deploy:
	cd tf/ && terraform plan && terraform apply --auto-approve

.PHONY: destroy

destroy:
	cd tf/ && terraform destroy --auto-approve

# Local Jenkins with Terraform and Docker Desktop

# Prerequisites

- Install Terraform
- Install Docker Desktop
- Enable Kubernetes in Docker Desktop

# Instructions

1. `make build` builds the Jenkins docker image
1. `make init` initializes the tf directory
1. `make deploy` plans and applies the terraform configuration
1. `make destroy` destroys the terraform configuration

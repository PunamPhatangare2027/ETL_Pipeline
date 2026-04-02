#!/bin/bash

echo "Initializing Terraform..."
cd terraform || exit

terraform init
terraform plan
terraform apply -auto-approve

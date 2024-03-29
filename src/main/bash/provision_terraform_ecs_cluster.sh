#!/bin/bash

# Get the current date in the format YYYYMMDD_HHMMSS
current_date=$(date +"%Y%m%d_%H%M%S")

cd ../terraform/aws/simple-ecs-cluster

# Format Terraform code
terraform fmt

# Initialize Terraform without user input
terraform init -input=false

# Run terraform plan and save the plan to a file named YYYYMMDD_HHMMSS.tfplan
terraform plan -out="$current_date.tfplan" -input=false

# Apply the plan with auto-approval and disable input
terraform apply -auto-approve -input=false "$current_date.tfplan"

# Archive the plan into a "old" directory
mkdir -p old
mv "$current_date.tfplan" old/

cd ../../../bash
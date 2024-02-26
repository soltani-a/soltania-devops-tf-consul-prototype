#!/bin/bash

################################################################################
# Script: terraform_destroy.sh
# Author: Slim SOLTANI DRIDI
# Date: 2024/02/23
# Description: This script performs a Terraform destroy operation.
#              It allows for easy replacement of the Terraform directory path.
################################################################################

# Define Terraform directory path
TERRAFORM_DIR="../terraform/aws/simple-ecs-cluster"

# Check if Terraform directory exists
if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "Error: Terraform directory '$TERRAFORM_DIR' not found."
    exit 1
fi

# Change directory to Terraform directory
cd "$TERRAFORM_DIR" || exit

# Check if Terraform initialization is needed
if [ ! -f ".terraform" ]; then
    echo "Initializing Terraform..."
    terraform init
fi

# Perform Terraform destroy
echo "Destroying infrastructure..."
terraform destroy -auto-approve

# Check if Terraform destroy was successful
if [ $? -eq 0 ]; then
    echo "Terraform destroy completed successfully."
else
    echo "Error: Terraform destroy failed."
    exit 1
fi

exit 0
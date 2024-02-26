#!/bin/bash

################################################################################
# Script: terraform_graph.sh
# Author: Slim SOLTANI DRIDI
# Date: 2024/02/24
# Description: This script generates a Terraform graph and saves it to a directory.
#              It allows for easy replacement of the Terraform directory path.
################################################################################

# Define Terraform directory path
TERRAFORM_DIR="../terraform/aws/simple-ecs-cluster"

# Define output directory for the graph
GRAPH_DIR="../../../resources/graph"

# Check if Terraform directory exists
if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "Error: Terraform directory '$TERRAFORM_DIR' not found."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$GRAPH_DIR"

# Change directory to Terraform directory
cd "$TERRAFORM_DIR" || exit

# Check if Terraform initialization is needed
if [ ! -f ".terraform" ]; then
    echo "Initializing Terraform..."
    terraform init
fi

# Generate Terraform graph
echo "Generating Terraform graph..."
terraform graph -draw-cycles -type=plan | dot -Tpng > "$GRAPH_DIR/terraform_graph.png"

# Check if graph generation was successful
if [ $? -eq 0 ]; then
    echo "Terraform graph generated successfully. You can find it at: $GRAPH_DIR/terraform_graph.png"
else
    echo "Error: Failed to generate Terraform graph."
    exit 1
fi

exit 0

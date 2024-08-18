#!/bin/bash

# Step 1: Create Bedrock project using Composer if the 'bedrock' directory doesn't exist
if [ ! -d "bedrock" ]; then
  echo "Creating Bedrock WordPress project using Composer..."
  composer create-project roots/bedrock bedrock
else
  echo "'bedrock' directory already exists. Skipping Bedrock creation."
fi

# Step 2: Build and run Docker containers using Docker Compose
echo "Building and starting Docker containers in detached mode..."
docker-compose up --build -d

# Optional: Display the status of running containers
docker-compose ps

echo "Containers are running in detached mode."

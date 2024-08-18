#!/bin/bash

# Step 1: Create Bedrock project using Composer if the 'bedrock' directory doesn't exist
if [ ! -d "bedrock" ]; then
  echo "Creating Bedrock WordPress project using Composer..."
  composer create-project roots/bedrock bedrock
else
  echo "'bedrock' directory already exists. Skipping Bedrock creation."
fi

# Step 2: Set up .env file with MySQL credentials
if [ -f "bedrock/.env.example" ]; then
  echo "Setting up .env file from .env.example..."

  # Copy .env.example to .env
  cp bedrock/.env.example bedrock/.env

  # Update .env with the database credentials
  sed -i '' "s/DB_NAME='database_name'/DB_NAME='wordpress'/g" bedrock/.env
  sed -i '' "s/DB_USER='database_user'/DB_USER='wordpressuser'/g" bedrock/.env
  sed -i '' "s/DB_PASSWORD='database_password'/DB_PASSWORD='wordpresspassword'/g" bedrock/.env
  sed -i '' "s|DB_HOST='localhost'|DB_HOST='mysql'|g" bedrock/.env
  sed -i '' "s|WP_HOME='http://example.com'|WP_HOME='http://localhost:8080'|g" bedrock/.env
else
  echo ".env.example file not found! Creating .env file with default MySQL credentials..."

  # Create a new .env file with default credentials
  cat <<EOL > bedrock/.env
DB_NAME='wordpress'
DB_USER='wordpressuser'
DB_PASSWORD='wordpresspassword'
DB_HOST='mysql'

WP_ENV='development'
WP_HOME='http://localhost:8080'
WP_SITEURL="\${WP_HOME}/wp"
EOL
fi

# Step 3: Build and run Docker containers using Docker Compose
echo "Building and starting Docker containers in detached mode..."
docker-compose up --build -d

# Optional: Display the status of running containers
docker-compose ps

echo "Containers are running in detached mode."

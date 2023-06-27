#!/bin/bash

# Define the image name and tag
image_name="my-registry/client-container"
image_tag="latest"

# Define the path to the Dockerfile and build context
dockerfile_path="./client/Dockerfile"
build_context="./client"

# Check if the image already exists
if docker image inspect "$image_name:$image_tag" &>/dev/null; then
    # Prompt the user to confirm if they want to overwrite the image
    read -p "Image already exists. Do you want to overwrite it? (y/n): " answer

    # Check the user's response
    if [ "$answer" != "y" ]; then
        echo "Image will not be overwritten."
        docker-compose up
        exit 0
    fi
fi

# Build the Docker image
echo "Building the Docker image..."
docker image build -t "$image_name:$image_tag" -f "$dockerfile_path" "$build_context"

echo "Image built successfully."

docker-compose up

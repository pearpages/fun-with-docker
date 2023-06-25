#!/bin/bash

NETWORK_NAME="my-network"

# Check if the network already exists
if [[ -z $(docker network ls --filter name=${NETWORK_NAME} --quiet) ]]; then
    # Create the network
    docker network create ${NETWORK_NAME}
    echo "Docker network '${NETWORK_NAME}' created."
else
    echo "Docker network '${NETWORK_NAME}' already exists."
fi

IMAGE_NAME="third-container"
IMAGE_TAG="latest"

# Check if the image already exists
if [[ -z $(docker images -q ${IMAGE_NAME}:${IMAGE_TAG}) ]]; then
    # Build the image
    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
    echo "Docker image '${IMAGE_NAME}:${IMAGE_TAG}' created."
else
    # Image exists, prompt for confirmation to rewrite
    read -p "Docker image '${IMAGE_NAME}:${IMAGE_TAG}' already exists. Do you want to rewrite it? (y/n): " choice
    if [[ ${choice} == "y" || ${choice} == "Y" ]]; then
        # Remove the existing image
        docker rmi ${IMAGE_NAME}:${IMAGE_TAG}

        # Build the new image
        docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
        echo "Docker image '${IMAGE_NAME}:${IMAGE_TAG}' rewritten."
    else
        echo "Skipped rewriting Docker image."
    fi
fi

docker run --rm --name third-container --network my-network -p 3000:3000 third-container

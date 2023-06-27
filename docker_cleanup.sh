#!/bin/bash

while true; do
    # List stopped containers
    stopped_containers=$(docker ps -a --filter "status=exited" --format "{{.ID}}: {{.Names}}")

    # Check if there are any stopped containers
    if [ -z "$stopped_containers" ]; then
        echo "No stopped containers found."
        break
    fi

    echo "Stopped Docker Containers:"
    echo "$stopped_containers"
    echo ""

    read -p "Enter the container ID to remove (a for all, or q to quit): " input

    # Check if user wants to quit
    if [ "$input" = "q" ]; then
        break
    fi

    # Check if user wants to remove all containers
    if [ "$input" = "a" ]; then
        docker rm $(docker ps -a -q --filter "status=exited")
        echo "All stopped containers removed."
        echo ""
        continue
    fi

    # Remove the specified container
    docker rm "$input"
    echo "Container $input removed."
    echo ""
done

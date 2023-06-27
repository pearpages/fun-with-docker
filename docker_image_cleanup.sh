#!/bin/bash

while true; do
    # List Docker images
    dangling_images=$(docker images -f "dangling=true" --format "{{.ID}}: {{.Repository}}")
    non_dangling_images=$(docker images --filter "dangling=false" --format "{{.ID}}: {{.Repository}}")

    # Check if there are any dangling or non-dangling images
    if [ -z "$dangling_images" ] && [ -z "$non_dangling_images" ]; then
        echo "No dangling or non-dangling images found."
        break
    fi

    echo "Dangling Images:"
    echo "$dangling_images"
    echo ""

    echo "Non-dangling Images:"
    echo "$non_dangling_images"
    echo ""

    read -p "Enter the image ID to remove (d for dangling, n for non-dangling, a for all, or q to quit): " input

    # Check if user wants to quit
    if [ "$input" = "q" ]; then
        break
    fi

    # Remove dangling images
    if [ "$input" = "d" ]; then
        docker rmi -f $(docker images -q -f "dangling=true")
        echo "All dangling images forcefully removed."
        echo ""
        continue
    fi

    # Remove non-dangling images
    if [ "$input" = "n" ]; then
        docker rmi -f $(docker images -q --filter "dangling=false")
        echo "All non-dangling images forcefully removed."
        echo ""
        continue
    fi

    # Remove all images
    if [ "$input" = "a" ]; then
        docker rmi -f $(docker images -q)
        echo "All images forcefully removed."
        echo ""
        continue
    fi

    # Remove the specified image
    docker rmi -f "$input"
    echo "Image $input forcefully removed."
    echo ""
done

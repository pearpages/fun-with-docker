#!/bin/bash
docker run --rm --name client-container --network docker-net_my-network -p 3002:3002 -e NODE_ENV='production' my-registry/client-container:latest

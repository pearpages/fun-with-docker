docker build -t second-container .
docker run --name second-container --network my-network second-container

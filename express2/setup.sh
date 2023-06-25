docker build -t third-container .
docker run --name third-container --network my-network third-container

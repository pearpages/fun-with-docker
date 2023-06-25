When calling the container in `client` this calls `express1` which calls `express2`.

## Stop all running containers

```shell
docker stop $(docker ps -aq)
````

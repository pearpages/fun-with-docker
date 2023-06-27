When calling the container in `client` this calls `express1` which calls `express2`.

## Naming and `docker-compose`

When using Docker Compose, Docker automatically generates names for networks and containers based on the names defined in the docker-compose.yml file. Docker Compose uses a combination of the project name, service name, and a numerical index to create unique names.

Here's how the naming works:

Project name: The project name is defined in the docker-compose.yml file using the project_name key under the version key. If not specified, Docker Compose uses the name of the directory containing the docker-compose.yml file as the project name.

Service name: Each service defined in the docker-compose.yml file has a name specified under the services section. Docker Compose uses this service name as part of the generated container and network names.

Numerical index: If you have multiple instances of the same service defined in the docker-compose.yml file, Docker Compose appends a numerical index to the container and network names to differentiate between them.

The generated names follow a specific pattern:

Network name: <project-name>_<service-name>_<index> (e.g., myproject_web_1).
Container name: <project-name>_<service-name>_<index>_<custom-name> (e.g., myproject_web_1_app).
In the above examples, "myproject" is the project name, "web" is the service name, "1" is the index, and "app" is a custom name that can be specified using the container_name key in the docker-compose.yml file.

Note that the generated names are unique within the project scope, allowing you to run multiple instances of the same service without conflicts.

You can override the generated names by providing explicit names for networks and containers in the docker-compose.yml file using the networks and container_name keys, respectively.

## Stop all running containers

```shell
docker stop $(docker ps -aq)
````

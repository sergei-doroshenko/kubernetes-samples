#!/bin/bash
# pack application with custom jre
echo "==================START================="
docker image build -f Dockerfile.jre -t sdoroshenko/greeting:jre-slim .
docker image ls
container_id=$(docker container run -d -p 8080:8080 sdoroshenko/greeting:jre-slim)
echo ContainerId=${container_id}
docker container ls
sleep 5
curl http://localhost:8080/
docker container stop ${container_id}
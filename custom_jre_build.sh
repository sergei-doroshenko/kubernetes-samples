#!/bin/bash
# create customized jre
echo "==================START================="
rm -rfv myjre
docker image build -f Dockerfile.jre.build -t sdoroshenko/custom-jre:11 .
docker image ls | grep sdoroshenko
container_id=$(docker container run -d sdoroshenko/custom-jre:11)
echo ContainerId=${container_id}
docker container ls
docker cp ${container_id}:/root/myjre .
du -d 0 -h myjre
echo "===================END================="
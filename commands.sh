#!/bin/bash
mvn -Dmaven.repo.local=./repository clean package &&
tar cf repository.tar.gz ./repository &&
docker image build -t sdoroshenko/greeting . &&
docker container run -p 8080:8080 sdoroshenko/greeting

# mvn package -Pjib
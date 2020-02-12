#!/bin/bash
# commands to create custom, slim jre and build docker image on top of it
rm -rf myjre/ &&
#cp target/spring-boot.war target/spring-boot.jar &&
jlink \
 --output myjre \
 --module-path $JAVA_HOME/lib \
 --add-modules $(jdeps --print-module-deps --ignore-missing-deps target/k8s-spring-boot-app.jar),java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument &&

sudo docker image build -f Dockerfile.jre -t sdoroshenko/greeting:jre-slim . &&
docker image ls
#sudo docker container run -d -p 8080:8080 sdoroshenko/greeting:jre-slim
#sudo docker container run -it -p 8080:8080 sdoroshenko/greeting:jre-slim
#curl http://localhost:8080/
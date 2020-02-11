cp target/spring-boot.war target/spring-boot.jar &&
jlink \
	--output myjre \
	--add-modules $(jdeps --print-module-deps target/spring-boot.jar),\
	java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,\
	java.management,java.security.jgss,java.instrument &&

	sudo docker image build -f Dockerfile.jre -t sdoroshenko/greeting:jre-slim . &&
	docker containter ls
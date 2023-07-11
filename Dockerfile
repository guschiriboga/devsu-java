FROM openjdk:17-slim-buster

WORKDIR /usr/devsu-java

COPY target/demo-0.0.1.jar ./devsu-java.jar

EXPOSE 8000

ENTRYPOINT [ "java", "-jar", "devsu-java.jar" ]
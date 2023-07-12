FROM openjdk:17-slim-buster

WORKDIR /usr/java-demo

COPY target/demo-0.0.1.jar ./java-demo.jar

EXPOSE 8000

ENTRYPOINT [ "java", "-jar", "java-demo.jar" ]
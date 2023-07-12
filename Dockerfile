FROM maven:3.9.3-eclipse-temurin-11 AS TEMP_BUILD_IMAGE
COPY . .
USER root
RUN mvn clean package

FROM openjdk:17-alpine
WORKDIR /usr/java-demo
COPY --from=TEMP_BUILD_IMAGE target/demo-0.0.1.jar ./java-demo.jar
EXPOSE 8000
ENTRYPOINT [ "java", "-jar", "java-demo.jar" ]
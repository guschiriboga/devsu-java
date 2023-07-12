FROM maven:3.9.3-eclipse-temurin-11-alpine AS TEMP_BUILD_IMAGE
COPY . /app/.
USER root
RUN cd /app && mvn clean package

FROM openjdk:17-alpine
WORKDIR /usr/java-demo
COPY --from=TEMP_BUILD_IMAGE /app/target/demo-0.0.1.jar ./java-demo.jar
EXPOSE 8000
ENTRYPOINT [ "java", "-jar", "java-demo.jar" ]
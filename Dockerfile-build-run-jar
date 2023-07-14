FROM maven AS TEMP_BUILD_IMAGE
COPY . .
USER root
RUN mvn clean package

FROM openjdk:17-alpine
WORKDIR /usr/java-demo
COPY --from=TEMP_BUILD_IMAGE target/demo-0.0.1.jar ./java-demo.jar
COPY --from=TEMP_BUILD_IMAGE test.mv.db .
EXPOSE 8000
ENTRYPOINT [ "java", "-jar", "java-demo.jar" ]
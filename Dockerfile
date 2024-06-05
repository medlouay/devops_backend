# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine
EXPOSE 8080

COPY target/achat-1.0.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]

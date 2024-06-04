# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine
EXPOSE 8080
# Copy the final JAR file to the container
COPY target/achat-1.0.jar app.jar
# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

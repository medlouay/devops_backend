# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Add the Maven dependencies and build the Spring Boot application
COPY pom.xml mvnw ./
COPY .mvn .mvn
RUN ./mvnw dependency:resolve

# Copy the source code and build the application
COPY src ./src
RUN ./mvnw package -DskipTests

# Copy the final JAR file to the container
COPY target/achat-1.0.jar app.jar

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

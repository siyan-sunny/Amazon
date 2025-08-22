# Use an official OpenJDK runtime as a parent image

FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-alpine

# Set a working directory inside the container
WORKDIR /app

RUN mvn clean package -DskipTests

# Copy the jar file into the container
COPY AmazonApp/target/AmazonApp-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port (default for Spring Boot is 8080)
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]

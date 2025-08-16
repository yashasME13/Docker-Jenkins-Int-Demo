# ---- STAGE 1: Build ----
FROM maven:3.9.11-eclipse-temurin-21 AS build

# Set work directory
WORKDIR /app

# Copy project files to the container
COPY pom.xml .
COPY src ./src

# Build the project (adjust to your needs)
RUN mvn clean package -DskipTests

# ---- STAGE 2: Run ----
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy built jar from previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose port if your app runs on a specific one (adjust if needed)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "untitled.jar"]

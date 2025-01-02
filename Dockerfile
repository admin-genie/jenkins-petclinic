FROM eclipse-temurin:17.0.10_7-jdk-jammy
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
CMD ["./mnvw", "spring-boot:run"]
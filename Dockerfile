FROM maven:3-openjdk-17 AS build
WORKDIR /app

COPY . .
RUN mvn clean package -DskipTests
RUN ls /app/target

FROM openjdk:17-jdk-slim
WORKDIR /app

COPY --from=build /app/target/valuationdiamond-0.0.1-SNAPSHOT.war valuationdiamond.war
EXPOSE 8080

ENTRYPOINT ["java","-jar","valuationdiamond.war"]
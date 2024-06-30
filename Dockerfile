# Sử dụng hình ảnh OpenJDK 17 với Alpine Linux
FROM openjdk:17-jdk-alpine
EXPOSE 80

# Thiết lập biến ARG cho tệp JAR và tệp cấu hình
ARG JAR_FILE=target/*.jar

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép tệp JAR từ thư mục target vào container
COPY ${JAR_FILE} app.jar

# Thiết lập lệnh khởi động container
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

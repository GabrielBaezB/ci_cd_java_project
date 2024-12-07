# Usa una imagen base ligera con Java 17
FROM openjdk:17-jdk-slim

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el JAR generado por Maven al contenedor
COPY target/ci_cd_java_project-*.jar /app/ci_cd_java_project.jar

# Expone el puerto que usará la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/ci_cd_java_project.jar"]

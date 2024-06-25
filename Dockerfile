FROM openjdk:17.0.2 as JAR_EXTRACT
#WORKDIR sets the current working directory and all the instructions will be exceuted inside thid directory, COPY, RUN< CMD, ENTRYPOINT
WORKDIR /app
ARG JAR_FILE=*.jar
COPY ./target/${JAR_FILE} ./app.jar
RUN java -Djarmode=layertools -jar ./app.jar extract
# Production Stage for Spring boot application image
FROM eclipse-temurin:17-jre-alpine as production

WORKDIR /application
COPY --from=JAR_EXTRACT /app/dependencies ./
COPY --from=JAR_EXTRACT /app/spring-boot-loader ./
COPY --from=JAR_EXTRACT /app/snapshot-dependencies ./
COPY --from=JAR_EXTRACT /app/application ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
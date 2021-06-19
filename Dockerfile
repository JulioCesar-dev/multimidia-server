FROM adoptopenjdk/openjdk8:jdk8u282-b08-debian
RUN apt-get update

RUN mkdir /app
RUN mkdir /multimedias
COPY . /app
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ./mvnw spring-boot:run

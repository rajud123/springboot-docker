## What is it?
This source code is an Spring Boot web application (mvc + thymeleaf).
 
Tested with
* Docker 19.03
* Ubuntu 19
* Java 8 or Java 11
* Spring Boot 2.2.4.RELEASE
* Maven

For explanation, please visit this article - [Docker and Spring Boot](https://mkyong.com/docker/docker-spring-boot-examples/)

## How to run this?
```bash
$ git clone https://github.com/mkyong/docker-java
$ cd docker-spring-boot
$ mvn clean package
$ java -jar target/spring-boot-web.jar

  access http://localhost:8080

//dockerize

// create a docker image
$ sudo docker build -t spring-boot:1.0 .
// run it
$ sudo docker run -d -p 8080:8080 -t spring-boot:1.0

  access http://localhost:8080
```
mvn clean install
  552  mvn package
  553  docker build -t my-application .
  554  docker run -p 8080:8080 my-application

refreash token is used o generate new jwt token when the token gets expired, when the user is logged in 

, spring security wiill give tokens one is refresh token and other is jwt/access token, so when the token gets expired
client hits refresh api call to server , server will validate the token and sends the new token to the client or user.

more about refresh tokens
https://medium.com/spring-boot/jwt-refresh-token-spring-security-c5b4646cdbd9
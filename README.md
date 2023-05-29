# TechStore - SPRING BOOT PROJECT
This is a [spring-boot-app](https://spring.io/) project bootstrapped with [`Spring Initializr`](https://start.spring.io/).


# How to run
  - Clone this repo to your device ```git clone https://github.com/TuanTo1711/TechStore.git ```
  - Requirement: [Docker](https://www.docker.com/get-started/)
  - You have a few options:
   * you don't have do anything else
```bash
docker-compose up -d
```
   * run single service (required run maildev)
```bash 
docker-compose up -d maildev
# or
docker-compose up -d maildev mssql
mvnw spring-boot:run
# or have mssql in local
docker-compose up -d maildev tech-store
```


### Reference Documentation

For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/3.0.6/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/3.0.6/maven-plugin/reference/html/#build-image)
* [Testcontainers MS SQL Server Module Reference Guide](https://www.testcontainers.org/modules/databases/mssqlserver/)
* [Testcontainers](https://www.testcontainers.org/)
* [Java Mail Sender](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#io.email)
* [Spring Web](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#web)
* [Spring Data JPA](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#data.sql.jpa-and-spring-data)
* [Validation](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#io.validation)
* [Spring Configuration Processor](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#appendix.configuration-metadata.annotation-processor)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#using.devtools)
* [Spring cache abstraction](https://docs.spring.io/spring-boot/docs/3.0.6/reference/htmlsingle/#io.caching)

### Guides

The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Validation](https://spring.io/guides/gs/validating-form-input/)
* [Caching Data with Spring](https://spring.io/guides/gs/caching/)

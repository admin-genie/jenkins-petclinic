# Spring PetClinic Sample Application
📌실습 링크
[![Naver Blog Badge](https://img.shields.io/badge/Naver%20Blog-03C75A?style=flat&logo=Naver&logoColor=white)](https://blog.naver.com/genie290)
---

## 1. Petclinic 로컬에서 실행하기
Spring Petclinic은 Spring Boot 애플리케이션으로 Maven 또는 Gradle로 빌드되었다. JAR 파일을 빌드하고 명령줄에서 실행할 수 있다.

- Java 17 이상 필요

```
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```
[http://localhost:8080/](http://localhost:8080)에서 애플리케이션 실행 가능\
Maven 플러그인으로 애플리케이션을 직접 실행할 수도 있음\
Gradle을 사용하는 경우 `.gradlew build`로 빌드하고 `build/libs`에서 생성된 JAR 파일을 찾으면 됨

## 2. 컨테이너 빌드
해당 프로젝트에는 `Dockerfile`이 없지만, Spring Boot 빌드 플러그인을 사용하여 Docker 이미지를 빌드할 수 있다.
```
./mvnw spring-boot:build-image
```

## 3. 데이터베이스 설정
기본적으로 Petclinic은 H2 인메모리 데이터베이스를 사용하며, 애플리케이션 시작 시 데이터가 로딩된다. H2 콘솔은 `http://localhost:8000/h2-console`에서 확인할 수 있다.

MySQL 및 PostgreSQL을 위한 설정도 제공되는데, 이를 사용하려면 다른 `profiles`을 사용해야 한다.
- MySQL : `spring.profiles.active=mysql`
- PostgreSQL : `spring.profiles.active=postgres`
```
## MySQL 또는 PostgreSQL을 로컬에서 실행하는 예제
PASSWORD=root -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:8.2
docker run -e POSTGRES_USER=petclinic -e POSTGRES_PASSWORD=petclinic -e POSTGRES_DB=petclinic -p 5432:5432 postgres:16.1
```
`docker-compose.yml`을 사용하여 데이터베이스를 실행할 수도 있다. 
```
docker-compose --profile mysql up
```

## 4. CSS 컴파일
`src/main/resources/static/resources/css`경로에 `petclinic.css`파일이 있다.
```
./mvnw package -P css
```

## 5. IDE에서 Petclinic 사용하기
#### 사전 준비
- Java 17 이상 (JDK 필요)
- Git
- IDE (Eclipse, IntelliJ, VS Code 등)

#### IntelliJ 사용법
1. 프로젝트 클론
```
git clone https://github.com/spring-projects/spring-petclinic.git
```
2. IntelliJ에서 `pom.xml`을 열고 프로젝트를 가져온다.
3. `PetClinicApplication`을 실행한다.
4. 브라우저에서 [http://localhost:8080/](http://localhost:8080)에 접속한다.

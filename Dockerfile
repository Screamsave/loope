FROM openjdk:8-jdk-alpine
FROM ubuntu

VOLUME /tmp

RUN apt-get update
RUN apt-get install -y git

RUN cd /tmp/

RUN git clone https://github.com/Screamsave/loope.git

RUN find /loope/  -type d -exec chmod 777 {} \;

RUN cd loope

RUN apt-get install -y maven 

WORKDIR /loope/foobarbaz/ 

RUN mvn clean
RUN mvn install

WORKDIR /loope/foobarbaz/target

EXPOSE 8080

ENTRYPOINT ["java","-jar","foobarbaz-1.0-SNAPSHOT.jar"]


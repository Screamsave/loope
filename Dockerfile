FROM openjdk:8-jdk-alpine
FROM ubuntu

VOLUME /tmp

RUN apt-get update
RUN apt-get install -y git

RUN cd /tmp/

RUN git clone https://github.com/Screamsave/loop.git

RUN find /loop/ -type d -exec chmod 777 {} \;

RUN cd loop

RUN apt-get install -y maven 

WORKDIR /loop/ 

RUN mvn clean
RUN mvn install

ARG JAR_FILE=loop/target/foobarbaz-1.jar 

ADD ${JAR_FILE} foobarbaz-1.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/foobarbaz-1.jar"]


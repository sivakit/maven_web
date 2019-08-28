From tomcat:latest
MAINTAINER sivaece496@gmail.com
WORKDIR /usr/local/tomcat/webapps
COPY ./target/student.war /usr/local/tomcat/webapps
EXPOSE 8080

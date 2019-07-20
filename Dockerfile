From omcat:latest2
MAINTAINER sivaece496@gmail.comm
WORKDIR /usr/local/tomcat/webapps
COPY ./target/student.war /usr/local/tomcat/webapps
EXPOSE 8080

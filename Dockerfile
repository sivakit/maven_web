From tomcat:latest
MAINTAINER sivaece496@gmail.com
WORKDIR /usr/local/tomcat/webapps
COPY ./target/student.war /usr/local/tomcat/webapps
EXPOSE 8080


#FROM ubuntu:latest

# Install prerequisites
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y sudo && \
    apt-get install -y iptables && \
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Install Docker
RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    usermod -aG docker root

# Install Kubectl

# Install kubectl
RUN apt-get update && \
    apt-get install -y apt-transport-https gnupg2 curl && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl



# Set default command
#CMD ["bash"]
CMD service docker start && bash

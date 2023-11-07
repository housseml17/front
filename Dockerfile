FROM maven:3.8.4-jdk-8-slim
WORKDIR /usr/lib/env
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Tunisia
RUN apt update
RUN apt install npm -y
RUN apt install curl -y
RUN apt install wget -y
RUN npm install -g npm@8.1.0
RUN npm install -g @angular/cli@12.2.3
RUN apt install tar -y
RUN apt install git -y

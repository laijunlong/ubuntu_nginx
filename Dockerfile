FROM ubuntu:14.04
MAINTAINER laijunlong1987@gmail.com
RUN apt-get update & apt-get install nginx
EXPOSE 80

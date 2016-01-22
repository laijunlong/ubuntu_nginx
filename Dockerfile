FROM ubuntu:14.04
MAINTAINER laijunlong1987@gmail.com
RUN apt-get update 
RUN apt-get install -y nginx
RUN echo "ubuntu-nginx build ok" > /usr/share/nginx/html/index.html
CMD [ "/bin/bash" ]
EXPOSE 80

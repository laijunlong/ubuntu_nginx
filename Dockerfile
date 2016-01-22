FROM ubuntu:14.04
MAINTAINER laijunlong1987@gmail.com
RUN apt-get update 
RUN apt-get install -y nginx
RUN echo "ubuntu-nginx build ok" > /usr/share/nginx/html/index.html
#在Dockerfile中只能制定一条CMD指令，如果指定了多条CMD指令，也只有最后一条CMD指令会被使用。
#如果想在启动容器时运行多个进程或者多个命令，可以考虑使用类似supervisor这样的服务管理工具。
CMD [ "/bin/bash" ]
EXPOSE 80

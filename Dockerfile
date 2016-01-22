FROM ubuntu:14.04
MAINTAINER laijunlong1987@gmail.com
RUN apt-get update 
RUN apt-get install -y nginx
RUN echo "ubuntu-nginx build ok" > /usr/share/nginx/html/index.html
#在Dockerfile中只能制定一条CMD指令，如果指定了多条CMD指令，也只有最后一条CMD指令会被使用。
#如果想在启动容器时运行多个进程或者多个命令，可以考虑使用类似supervisor这样的服务管理工具。
#CMD [ "/bin/bash" ]
#ENTRYPOINT 提供的命令不会被覆盖
ENTRYPOINT [ "/user/bin/nginx","-g","daemon off;" ]
#WORKDIR 设置和切换工作目录
#ENV 在镜像构建过程中设置环境变量,这些环境变量同样会被记录在构建的容器中。也可以在启动命令中指定 -e “WEB_PORT=8080” 来设置环境变量
#例如
#ENV TARGET_DIR /opt/app
#WORKDIR $TARGET_DIR

#USER 指定该镜像会以什么样的用户去运行，run 命令中通过-u 选项来覆盖该指令的值。 
#VOLUME 添加卷 
#例如 VOLUME [ "/opt/project","/data"]

EXPOSE 80

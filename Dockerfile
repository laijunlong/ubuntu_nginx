FROM ubuntu:14.04
MAINTAINER laijunlong1987@gmail.com
RUN apt-get update 
RUN apt-get install -y nginx
RUN echo "ubuntu-nginx build ok" > /usr/share/nginx/html/index.html
#在Dockerfile中只能制定一条CMD指令，如果指定了多条CMD指令，也只有最后一条CMD指令会被使用。
#如果想在启动容器时运行多个进程或者多个命令，可以考虑使用类似supervisor这样的服务管理工具。
#CMD [ "/bin/bash" ]
#ENTRYPOINT 提供的命令不会被覆盖
ENTRYPOINT [ "/usr/sbin/nginx","-g","daemon off;" ]
#WORKDIR 设置和切换工作目录
#ENV 在镜像构建过程中设置环境变量,这些环境变量同样会被记录在构建的容器中。也可以在启动命令中指定 -e “WEB_PORT=8080” 来设置环境变量
#例如
#ENV TARGET_DIR /opt/app
#WORKDIR $TARGET_DIR

#USER 指定该镜像会以什么样的用户去运行，run 命令中通过-u 选项来覆盖该指令的值。 
#VOLUME 添加卷 
#例如 VOLUME [ "/opt/project","/data"]

#ADD 指令用来将构建环境下的文件和目录复制到镜像中。比如，在安装一个应用程序时，ADD指令需要源文件位置和目的文件位置两个参数
#例如 ADD software.lic /opt/application/software.lic
#ADD 指令会将构建目录下的 software.lic 文件复制到镜像中的 /opt/application/software.lic。可以是URL的源地址
#如果是归档文件 ADD 会自动将归档文件解开(unpack)
#例如 ADD latest.tar.gz /var/www/wordpress/

#COPY 只关心在构建上下文中复制本地文件，不会去做文件提取和解压工作。
#例如 COPY conf.d /etc/apache2/

EXPOSE 80

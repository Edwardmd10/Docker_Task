# This is a docker file 

FROM centos:7 

RUN yum update -y && \ 
    yum install telnet httpd -y  && \ 
    mkdir /tmp/photos  && \ 
    touch /tmp/files 

LABEL appname="shared tools" 

MAINTAINER edwardmd10 

ENV WORDPRESS_DB_HOST="localhost" \ 
    WORDPRESS_USER="wordpress" \ 
    WORDPRESS_DB="wordpress" 

ADD https://wordpress.org/latest.zip   /tmp 

EXPOSE 80 

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]  
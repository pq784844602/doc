#
# MAINTAINER        Joson
# DOCKER-VERSION    1.0.0
#
# docker base centos
#
# docker build -t nginx:centos .
#
# docker run -it -p 3308:3306 -v /data/mysql:/var/lib/mysql  mariadb:centos bash
# docker run --name mysql -v /usr/local/mysql/data:/var/lib/mysql -d pq784844602/mariadb
#
# docker exec -it mysql bash
#
  
FROM centos
MAINTAINER Joson  

RUN yum -y install epel-release && yum -y install nginx && yum clean all   
RUN echo "daemon off;" >> /etc/nginx/nginx.conf 
  
EXPOSE 80 
  
CMD ["nginx"]
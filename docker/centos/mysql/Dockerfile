#
# MAINTAINER        Joson
# DOCKER-VERSION    1.0.0
#
# docker base centos
#
# docker build -t mariadb:centos .
#
# docker run -it -p 3308:3306 -v /data/mysql:/var/lib/mysql  mariadb:centos bash
# docker run --name mysql -v /usr/local/mysql/data:/var/lib/mysql -d pq784844602/mariadb
#
# docker exec -it mysql bash
#
FROM centos

RUN yum -y install mariadb mariadb-server && mysql_install_db --user=mysql


#VOLUME /var/lib/mysql 
#COPY docker-entrypoint.sh /usr/local/bin/
#ENTRYPOINT ["docker-entrypoint.sh"]


EXPOSE 3306

CMD ["mysqld_safe"]
	
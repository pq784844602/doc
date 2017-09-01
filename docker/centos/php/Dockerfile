#
# MAINTAINER        Joson
# DOCKER-VERSION    1.0.0
#
# docker base centos
#
# docker build -t php:centos .
#
# docker run -it -p 3308:3306 -v /data/mysql:/var/lib/mysql  mariadb:centos bash
# docker run --name mysql -v /usr/local/mysql/data:/var/lib/mysql -d pq784844602/mariadb
#
# docker exec -it mysql bash
#
FROM centos

RUN yum -y install epel-release && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && yum -y install --enablerepo=remi --enablerepo=remi-php56 php php-fpm php-gd php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof php-pecl-memcache php-pecl-memcached php-pecl-swoole php-pecl-redis && yum clean all


EXPOSE 9000
CMD ["php-fpm"]
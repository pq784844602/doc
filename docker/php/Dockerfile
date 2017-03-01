#
# MAINTAINER        Joson
# DOCKER-VERSION    1.0.0
# base office images php:5.6-fpm ,add extend redis ,memcached for images
#
#command : docker build -t php5:redis .
#

FROM php:5.6-fpm

MAINTAINER Joson

RUN pecl install redis \
	&&  rm -rf /tmp/pear \
	&&  docker-php-ext-enable redis
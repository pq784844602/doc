#
# MAINTAINER        Joson
# DOCKER-VERSION    1.0.0
#
# base centos ;add openresty;
#
# command : docker build -t openresty:v1 .
#

FROM centos:latest

MAINTAINER Joson

RUN yum install yum-utils \
	&&  yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo \
	&&  yum install -y openresty \
	&&  yum install -y openresty-resty

EXPOSE 8083
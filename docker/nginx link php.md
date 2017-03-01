
1、启动mariadb容器
docker run -d --name mariadb pq784844602/mariadb

1、运行官网php7:latest 挂载到目录/var/www,连接数据库--link mariadb:mysql 
docker run --name php7 -d -v /var/www:/var/www/html --link mariadb:mysql php:7.1.0-fpm

2、通过--link连接php7容器，并且使用--volumes-from php7将php7容器挂载的卷也挂载到了nginx容器上，使用自定义nginx配置文件（nginx.conf）覆盖了原先的配置,
docker run --name nginx -d -p 80:80 --link php7:php7 -v /usr/local/nginx/conf.d:/etc/nginx/conf.d --volumes-from php7  nginx








***
删除所有正在运行的docker container
docker rm -f $(docker ps -a -q) 
删除所有镜像
docker rmi $(docker images -a)
参考文章
https://segmentfault.com/a/1190000002949036


需要注意的是，在该配置文件中设置了服务器的根目录(root)为/var/www/html 目录，也就是我们挂载的目录，另外是phpfpm的配置，我们将fastcgi_pass的值从127.0.0.1:9000改为了php7:9000，这里的php7是域名，在nginx容器的/etc/hosts文件中自动配置为php7容器的访问IP。

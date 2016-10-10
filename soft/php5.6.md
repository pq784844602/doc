#新建www 用户和www 组
groupadd -r www  && useradd -r -g www  -s /bin/false  www 


一、安装相关依赖库
 yum -y install gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel curl curl-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers pcre pcre-devel gd gd-devel

php依赖库安装
libxml2 ———— 包含库和实用工具用于解析XML文件
wget http://xmlsoft.org/sources/libxml2-2.9.0.tar.gz
tar zxvf libxml2-2.9.0.tar.gz
cd libxml2-2.9.0
./configure
make&&make install

libmcrypt ———— 加密算法扩展库(支持DES, 3DES, RIJNDAEL, Twofish, IDEA, GOST, CAST-256, ARCFOUR, SERPENT, SAFER+等算法) 
wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/libmcrypt/libmcrypt-2.5.7.tar.gz
tar zxvf libmcrypt-2.5.7.tar.gz
cd libmcrypt-2.5.7
./configure
make && make install

二、安装php
wget http://cn2.php.net/distributions/php-5.6.26.tar.bz2
tar -jxvf php-5.6.26.tar.bz2
cd php-5.6.26
 
./configure \
--prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--enable-fpm \
--with-mysql=/usr/local/mysql \
--with-mysqli=/usr/local/mysql/bin/mysql_config \
--with-mysql-sock \
--enable-pdo \
--with-pdo-mysql \
--with-openssl \
--enable-mbstring \
--with-zlib \
--enable-xml \
--with-libxml-dir \
--with-freetype-dir \
--with-gd \
--with-jpeg-dir \
--with-png-dir \
--with-gettext \
--with-openssl-dir \
--enable-bcmath \
--with-mcrypt \
--with-iconv \
--enable-pcntl \
--enable-shmop \
--enable-simplexml \
--with-curl \
--enable-ftp

make
make install
三、配置
cp php.ini-development /usr/local/php/etc/php.ini 
cp etc/php-fpm.conf.default etc/php-fpm.conf



设置开机启动
chmod +x /etc/init.d/php-fpm
chkconfig php-fpm on
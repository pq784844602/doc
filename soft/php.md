#新建php用户和php组
groupadd -r php && useradd -r -g php -s /bin/false -d /usr/local/php7 -M php

#安装编译php7时需要的依赖包
yum -y install libxml2 libxml2-devel openssl openssl-devel curl-devel libjpeg-devel libpng-devel freetype-devel libmcrypt-devel

#创建php目录
mkdir -p /usr/local/php

#安装
./configure \
--prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--with-mysql-sock=/var/run/mysql/mysql.sock \
--with-mcrypt=/usr/include \
--with-mhash \
--with-openssl \
--enable-mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-gd \
--with-iconv \
--with-zlib \
--enable-zip \
--enable-inline-optimization \
--disable-debug \
--disable-rpath \
--enable-shared \
--enable-xml \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-mbregex \
--enable-mbstring \
--enable-ftp \
--enable-gd-native-ttf \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-soap \
--without-pear \
--with-gettext \
--enable-session \
--with-curl \
--with-jpeg-dir \
--with-png-dir \
--with-freetype-dir \
--enable-opcache \
--enable-fpm \
--with-fpm-user=nginx \
--with-fpm-group=nginx \
--without-gdbm \
--disable-fileinfo

make
make install

#将php编译生成的bin目录添加到当前Linux系统的环境变量中
export PHP=/usr/local/php/bin:/usr/local/php/sbin

#直接使用编译后未经优化处理的配置
cp php.ini-production /usr/local/php/etc/php.ini
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf

#设置PHP开机启动以及测试配置文件是否正确
chmod +x /etc/init.d/php-fpm
chkconfig --add php-fpm
chkconfig php-fpm on
php-fpm -t


#启动php服务
service php-fpm start
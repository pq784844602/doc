#####http://www.tuicool.com/articles/BFJz6zN
#nginx编译安装
#新建nginx用户和nginx组
groupadd -r nginx && useradd -r -g nginx -s /bin/false -M nginx

#yum安装nginx必须的依赖库
yum -y install openssl openssl-devel libxml2-devel libxslt-devel perl-devel perl-ExtUtils-Embed pcre-devel zlib zlib-devel

#官网下载Nginx1.10.0的tar包，然后解压到服务器上
tar -zxf nginx-1.10.0.tar.gz && cd nginx-1.10.0

#新建Nginx1.9.0安装时所需要的目录
cd /var/tmp/ && mkdir -p /var/tmp/nginx/{client,proxy,fastcgi,uwsgi,scgi}
mkdir -p /usr/local/nginx

#安装
./configure \
--prefix=/usr/local/nginx \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid  \
--lock-path=/var/lock/nginx.lock \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_xslt_module \
--with-http_stub_status_module \
--with-http_sub_module \
--with-http_random_index_module \
--with-http_degradation_module \
--with-http_secure_link_module \
--with-http_gzip_static_module \
--with-http_perl_module \
--with-pcre \
--with-zlib=/usr/local/src/zlib-1.2.8 \
--with-debug \
--with-file-aio \
--with-mail \
--with-mail_ssl_module \
--http-client-body-temp-path=/var/tmp/nginx/client_body \
--http-proxy-temp-path=/var/tmp/nginx/proxy \
--http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
--http-scgi-temp-path=/var/tmp/nginx/scgi \
--with-stream \
--with-ld-opt="-Wl,-E"

make
make install

#配置Nginx1.10.0


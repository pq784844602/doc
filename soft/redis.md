#解压
tar -zxvf redis-3.2.0.tar.gz

#安装
mkdir -p /usr/local/redis
make PREFIX=/usr/local/redis install

#配置redis cd utils(源码目录)
./install_server.sh
Port           : 6379
Config file    : /etc/redis/6379.conf
Log file       : /var/log/redis_6379.log
Data dir       : /var/lib/redis/6379
Executable     : /usr/local/redis/bin/redis-server
Cli Executable : /usr/local/redis/bin/redis-cli
Is this ok? Then press ENTER to go on or Ctrl-C to abort.
Copied /tmp/6379.conf => /etc/init.d/redis_6379
Installing service...
Successfully added to chkconfig!
Successfully added to runlevels 345!
Starting Redis server...
Installation successful!


#编辑redis.conf
daemonize yes #转为守护进程，否则启动时会每隔5秒输出一行监控信息

#启动
redis-server /etc/redis/6379.conf 


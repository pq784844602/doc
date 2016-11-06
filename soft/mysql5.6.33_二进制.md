1 环境介绍
操作系统: CentOS release 6.5 (Final) 64位

2 安装软件
二进制包：http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.33-linux-glibc2.5-x86_64.tar.gz
Mysql下载地址：http://dev.mysql.com/downloads/
Mysql版本选择：Select Platform Linux - Generic

3 安装步骤
3.1 创建用户和组
groupadd mysql
useradd  -r -g mysql -s /bin/false mysql

3.2数据存放路径及安装目录（去掉）
mkdir -p  /var/data/mysql
chown -R mysql:mysql /var/data/mysql

3.3 安装mysql到/usr/local/mysql下
cd /usr/local

tar zxvf /{MySQL5.6_path}/mysql-{version}.tar.gz

3.4 修改解压后文件夹名为 mysql
mv mysql-5.6.33-linux-glibc2.5-x86_64 mysql

3.5 修改mysql的各级文件夹和文件的创建者、创建组为mysql（注意语句后面有个.）
cd mysql
chown -R mysql .
chgrp -R mysql .

3.6 至此mysql已经安装完了，但还需要初始化，初始化mysql表、test表、infomation表等。
#./scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/var/data/mysql

3.7 复制mysql服务启动脚本及加入PATH路径
cp support-files/mysql.server /etc/init.d/mysqld 

3.8 复制mysql服务启动配置文件
cp my.cnf /etc/my.cnf
注：如果/etc/my.cnf文件存在，则覆盖。
vi /etc/my.cnf
[mysqld]中添加：
 
basedir = /usr/local/mysql
datadir = /var/data/mysql
port = 3306
server_id = 1

3.9启动mySQL服务及开机自启动

ln -s /usr/local/mysql/bin/mysql /usr/bin

service mysqld start

chkconfig --level 35 mysqld on

4.10 检查mysql服务是否启动
ps -ef|grep 3306  

4.11 修改MySQL用户root的密码
mysql -u root -p   
mysql> SELECT user,host,password FROM mysql.user;
+------+-----------+----------+
| user | host      | password |
+------+-----------+----------+
| root | localhost |          |
| root | 10-4-5-9  |          |
| root | 127.0.0.1 |          |
| root | ::1       |          |
|      | localhost |          |
|      | 10-4-5-9  |          |
+------+-----------+----------+
6 rows in set (0.00 sec)
 
mysql> UPDATE mysql.user set password = PASSWORD('123456') WHERE user = 'root';
 
mysql> DROP USER ''@localhost;
 
mysql> FLUSH PRIVILEGES;

5开启远程登录
5.1 修改数据表
mysql> use mysql
mysql> update user set Host='%' where User='root'; 

5.2 授权权限
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION; 
mysql> FLUSH PRIVILEGES;  

两者选一;


问题：


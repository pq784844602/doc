CentOS7以上的版本采用mariadb替代了MySQL，因此安装mariadb。 
1、安装mariadb服务 yum install mariadb mariadb-server

2、创建的系统启动mariadb的链接和启动它： 
systemctl start mariadb.service
systemctl enable mariadb.service 

3、现在检查网络启用。运行ps -ef|grep mariadb 

4、设置mariadb的访问权限，防止任何人都能访问。 
mysql_secure_installation 
设置新的密码

二、新建用户，修改权限，用新用户远程连接。
grant all privileges on *.* to crm@"%" identified by "trussan2016";
flush privileges;

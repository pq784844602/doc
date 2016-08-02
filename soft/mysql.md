#http://blog.csdn.net/wendi_0506/article/details/39478369
mysql-5.5.49 编译安装
一、卸载旧版本
1 使用下面的命令检查是否安装有MySQL Server
rpm -qa | grep mysql

2 有的话通过下面的命令来卸载掉
rpm -e mysql   //普通删除模式
rpm -e --nodeps mysql    // 强力删除模式，如果使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除

二：安装MySQL
1、安装编译代码需要的包
yum install gcc gcc-c++ ncurses-devel perl  bison-devel
2、预先配置步骤
shell> groupadd mysql
shell> useradd -r -g mysql -s /bin/false mysql

3、创建mysql安装文件夹及数据存放路径
mkdir -p  /usr/local/mysql
mkdir -p  /var/data/mysql

4、解压安装 
tar xvf mysql-5.5.49.tar.gz
cd mysql-5.5.49


cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DMYSQL_UNIX_ADDR=/var/run/mysql/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_ARCHIVE_STORAGE_ENGINE=1 \
-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
-DMYSQL_DATADIR=/var/data/mysql \
-DMYSQL_TCP_PORT=3306 \
-DENABLE_DOWNLOADS=1

注：重新运行配置，需要删除CMakeCache.txt文件
rm CMakeCache.txt 

编译源码
make 
安装
make install 

5、改变mysql数据文件夹的属性
chown -R mysql:mysql /usr/local/mysql
chown -R mysql:mysql /var/data/mysql

6、初始化mysql数据库
cd /usr/local/mysql   
scripts/mysql_install_db --user=mysql --datadir=/var/data/mysql 

7、复制mysql服务启动配置文件
cp /usr/local/mysql/support-files/my-medium.cnf /etc/my.cnf
注：如果/etc/my.cnf文件存在，则覆盖。

8、复制mysql服务启动脚本及加入PATH路径
cp support-files/mysql.server /etc/init.d/mysqld   
  
vim /etc/profile   
  
      PATH=/usr/local/mysql/bin:/usr/local/mysql/lib:$PATH  
  
      export PATH  
  
source /etc/profile

9、启动mysql服务并加入开机自启动(可选这个步骤，以后可以自己启动的)
service mysqld start 
chkconfig --level 35 mysqld on

10、检查mysql服务是否启动
netstat -tulnp | grep 3306   
mysql -u root -p   

11、修改MySQL用户root的密码
mysqladmin -u root password '123456'  
注：也可运行安全设置脚本，修改MySQL用户root的密码，同时可禁止root远程连接，移除test数据库和匿名用户。
/usr/local/mysql/bin/mysql_secure_installation 


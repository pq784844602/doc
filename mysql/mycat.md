#http://blog.csdn.net/linuxlsq/article/details/52606225
1、安装Java（http://jingyan.baidu.com/article/4853e1e51d0c101909f72607.html）
查看CentOS自带JDK是否已安装。
◆输入：yum list installed |grep java。


若有自带安装的JDK，如何卸载CentOS系统自带Java环境？
◆卸载JDK相关文件输入：yum -y remove java-1.7.0-openjdk*。
◆卸载tzdata-java输入：yum -y remove tzdata-java.noarch。



查看yum库中的Java安装包。
◆输入：yum -y list java* 。



使用yum安装Java环境。
◆输入：yum -y install java-1.7.0-openjdk* ，以yum库中java-1.7.0为例。 
  当结果显示为Complete！即安装完毕。


查看刚安装的Java版本信息。
◆输入：java -version 可查看Java版本；
◆输入：javac 可查看Java的编译器命令用法（可略）。

设置路径
vim /etc/profile
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
source /etc/profile

2、权限
chmod +x mycat

3、启动
./bin/mycat start

4、配置server.xml、schema.xml

5、安装zookeeper
cp zoo_sample.cfg zoo.cfg
bin/zkServer.sh start 

6、启动mycat eye
start.sh &


7、自动启动mycat
vi  /etc/rc.local 
添加 /usr/local/mycat/bin/mycat start


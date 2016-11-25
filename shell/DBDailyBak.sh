#!/bin/bash
# Program
#    use cp to backup mysql data everyday!
# Path 
# recover mysqlbinlog --no-defaults mysql-bin.000001 |mysql -u -p
# 
BakDir=/data/mysql/backup/daily
LogFile=/data/mysql/backup/bak.log

if [ ! -d "$BakDir" ];then
        mkdir -p $BakDir
fi

BinDir=/var/lib/mysql
BinFile=/var/lib/mysql/mysql-bin.index
MYSQLADMIN="/usr/bin/mysqladmin"
DBUSER=""
DBPASSWD=""
$MYSQLADMIN -h 127.0.0.1 -u $DBUSER -p$DBPASSWD flush-logs
#这个是用于产生新的mysql-bin.00000*文件
Counter=`wc -l $BinFile |awk '{print $1}'`
NextNum=0
#这个for循环用于比对$Counter,$NextNum这两个值来确定文件是不是存在或最新的。
for file in  `cat $BinFile`
do
        base=`basename $file`
        #basename用于截取mysql-bin.00000*文件名，去掉./mysql-bin.000005前面的./
        NextNum=`expr $NextNum + 1`
        if [ $NextNum -eq $Counter ]
        then
                echo $base skip!  >> $LogFile
        else
                dest=$BakDir/$base
                if(test -e $dest)
                #test -e用于检测目标文件是否存在，存在就写exist!到$LogFile去。
                then
                        echo  $base exist! >> $LogFile
                else
                        cp $BinDir/$base $BakDir
                        echo $base copying >> $LogFile
                fi
        fi
done
echo `date +"%Y年%m月%d日 %H:%M:%S"` $Next Bakup succ! >> $LogFile
find $BakDir -name "*.sql.tgz" -type f -mtime +7 -exec rm {} \; > /dev/null 2>&1
#!/bin/bash
# Program
#    use mysqldump to Fully backup mysql data per week!
# 	 and Delete old Backup 
# Path
BakDir=/data/mysql/backup
LogFile=/data/mysql/backup/bak.log
Date=`date +%Y%m%d`
Begin=`date +"%Y年%m月%d日 %H:%M:%S"`
MYSQLDUMP="/usr/bin/mysqldump"
DBUSER=""
DBPASSWD=""
DBNAME1="mediaman"
DBNAME2="messagecenter"
DBNAME3="usercenter"
DBNAME4="weiphp"

DumpFile=$Date.sql
DumpFile1=$Date$DBNAME1.sql
DumpFile2=$Date$DBNAME2.sql
DumpFile3=$Date$DBNAME3.sql
DumpFile4=$Date$DBNAME4.sql
GZDumpFile=$Date.sql.tgz
GZDumpFile1=$Date$DBNAME1.sql.tgz
GZDumpFile2=$Date$DBNAME2.sql.tgz
GZDumpFile3=$Date$DBNAME3.sql.tgz
GZDumpFile4=$Date$DBNAME4.sql.tgz

cd $BakDir

# $MYSQLDUMP -h 127.0.0.1 -u $DBUSER -p$DBPASSWD --quick --all-databases --flush-logs --delete-master-logs --single-transaction > $DumpFile
$MYSQLDUMP -h 127.0.0.1 -u$DBUSER -p$DBPASSWD --quick  --single-transaction --databases $DBNAME1> $DumpFile1
$MYSQLDUMP -h 127.0.0.1 -u$DBUSER -p$DBPASSWD --quick  --single-transaction --databases $DBNAME2> $DumpFile2
$MYSQLDUMP -h 127.0.0.1 -u$DBUSER -p$DBPASSWD --quick  --single-transaction --databases $DBNAME3> $DumpFile3
$MYSQLDUMP -h 127.0.0.1 -u$DBUSER -p$DBPASSWD --quick --flush-logs --delete-master-logs --single-transaction --databases $DBNAME4> $DumpFile4
tar czf $GZDumpFile1 $DumpFile1
tar czf $GZDumpFile2 $DumpFile2
tar czf $GZDumpFile3 $DumpFile3
tar czf $GZDumpFile4 $DumpFile4 
rm $DumpFile1 DumpFile2 DumpFile3 DumpFile4
Last=`date +"%Y年%m月%d日 %H:%M:%S"`
echo 开始:$Begin 结束:$Last $GZDumpFile succ >> $LogFile
find $BakDir -name "*.sql.tgz" -type f -mtime +30 -exec rm {} \; > /dev/null 2>&1
#cd $BakDir/daily
#rm -f *
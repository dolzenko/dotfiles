#!/bin/sh
if [ $# -lt 1 ]; then
	echo '«адайте им€ базы данных (и возможно опциональные параметры дл€ передачи mysqldump)'
	exit 1
fi
date=`date +%Y%m%d%H%M%S`
backupname=$1-$date.sql.gz
echo backing up to $backupname
/usr/local/mysql/bin/mysqldump -u root -h 127.0.0.1 $@ | gzip -c > $backupname

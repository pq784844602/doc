#!/bin/bash
set -e

echo $@;
echo 'Initializing database'
mysql_install_db --user=mysql
echo 'Database initialized'

mysqld_safe
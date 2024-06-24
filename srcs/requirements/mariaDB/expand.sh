#!/bin/bash

# Prepare a SQL file with initialization commands using echo commands
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" > /var/lib/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /var/lib/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';" >> /var/lib/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /var/lib/mysql/init.sql

echo -e "Init SQL file created"

chown -R mysql:mysql /var/lib/mysql

mariadb-install-db

exec mariadbd --user=mysql

 

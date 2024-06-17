#!/bin/bash

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
#touch  /var/lib/mysql/mysql.sock
#chmod +x  /var/lib/mysql/mysql.sock
# Prepare a SQL file with initialization commands using echo commands
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" > /var/lib/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /var/lib/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';" >> /var/lib/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

echo -e "${GREEN}Init SQL file created${NC}"

#chmod +x  /etc/mysql/init.sql

mariadb-install-db

#tail -f /dev/null

exec mariadbd --user=mysql

 

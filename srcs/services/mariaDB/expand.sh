#!/bin/bash

if [ -f .env]; then
	export $(cat .env | xargs)

fi

# Generate init.sql content
cat << EOF > init.sql
CREATE DATABASE IF NOT EXISTS \'${MYSQL_DATABASE}\';
CREATE USER IF NOT EXISTS \'${MYSQL_USER}\'@\'%\' IDENTIFIED BY \'${MYSQL_PASSWORD}\';
GRANT ALL PRIVILEGES ON \'${MYSQL_DATABASE}\'.* TO \'${MYSQL_USER}\'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

EOF

echo "init.sql generated successfully!"

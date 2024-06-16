#!/bin/bash

# Download and install WP-CLI
wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# Download WordPress
wget -q https://wordpress.org/latest.tar.gz -P /var/www \
    && tar -xzvf /var/www/latest.tar.gz -C /var/www --strip-components=1 \
    && rm /var/www/latest.tar.gz

# Set directory permissions (adjust as necessary)
chown -R www-data:www-data /var/www/html

# Configure WordPress
cd /var/www/html
wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost="${MYSQL_HOSTNAME}" --allow-root --skip-check

# Install WordPress
wp core install --url="${DOMAIN_NAME}" \
                --title="${WP_TITLE}" \
                --admin_user="${WP_ADMIN}" \
                --admin_password="${WP_ADMIN_PASSWORD}" \
                --admin_email="${WP_ADMIN_MAIL}" \
                --allow-root

# Create additional WordPress user
wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_PASSWORD}" --allow-root

# Start PHP-FPM
php-fpm7.4 -F


#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -x  # Print commands and their arguments as they are executed

echo "Starting script..."

sleep 3

# Check if WP-CLI is already installed
if [ ! -f /usr/local/bin/wp ]; then
    echo "Downloading WP-CLI..."
    wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp

    # Verify WP-CLI download
    if [ ! -f /usr/local/bin/wp ]; then
        echo "WP-CLI download failed."
        exit 1
    fi
else
    echo "WP-CLI is already installed."
fi

# Check if WordPress is already downloaded
if [ ! -d /var/www/html/wp-admin ]; then
    echo "Downloading WordPress..."
    wget -q https://wordpress.org/latest.tar.gz -P /var/www
    tar -xzvf /var/www/latest.tar.gz -C /var/www/html --strip-components=1
    rm /var/www/latest.tar.gz

    # Verify WordPress download
    if [ ! -d /var/www/html/wp-admin ]; then
        echo "WordPress download failed."
        exit 1
    fi

    # Set directory permissions
    echo "Setting directory permissions..."
    chown -R www-data:www-data /var/www/html/
else
    echo "WordPress is already downloaded."
fi

# Debugging step: List files in /var/www after download
echo "Contents of /var/www after download:"
ls -la /var/www

# Debugging step: List files in /var/www/html after download
echo "Contents of /var/www/html after download:"
ls -la /var/www/html

# Debugging step: List files in /var/www/html after setting permissions
echo "Contents of /var/www/html after setting permissions:"
ls -la /var/www/html/

# Check if WordPress is already configured
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Configuring WordPress..."
    cd /var/www/html/
    wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOSTNAME} --allow-root --skip-check

    # Install WordPress
    echo "Installing WordPress..."
    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_MAIL} --allow-root

    # Create additional WordPress user
    echo "Creating additional WordPress user..."
    wp user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root
else
    echo "WordPress is already configured."
fi

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm7.4 -F




FROM debian:bullseye

RUN apt update \
    && apt upgrade -y \
    && apt install -y php7.4-fpm \
    php7.4-mysql \
    curl \
    wget \
    mariadb-client

COPY www.conf /etc/php/7.4/fpm/pool.d/.

COPY script.sh .

RUN chmod +x script.sh

RUN mkdir -p  /run/php \
	&& mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chown -R www-data:www-data /var/log/
RUN chown -R www-data:www-data /run/php

CMD ["./script.sh"]

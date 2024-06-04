FROM debian:bullseye

RUN apt update \
    && apt upgrade -y \
    && apt install -y nginx openssl

COPY default /etc/nginx/sites-available/.

RUN openssl req -x509 -nodes -days 356 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj /C=DE/ST=Heilbronn/L=Heilbronn/O=wordpress/CN=$DOMAIN

CMD  ["nginx", "-g", "daemon off;"]

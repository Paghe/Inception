FROM debian:latest

RUN apt update \
    && apt upgrade -y \
    && apt install -y nginx

COPY default /etc/nginx/sites-available/.
COPY /certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY /certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

CMD ["nginx", "-g", "daemon off;"]

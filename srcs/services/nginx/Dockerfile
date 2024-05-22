FROM debian:latest

RUN apt update \
    && apt upgrade -y \
    && apt install -y nginx openssl

COPY default /etc/nginx/sites-available/.
#COPY certs/nginx-selfsigned.crt /etc/ssl/nginx-selfsigned.crt
#COPY certs/nginx-selfsigned.key /etc/ssl/nginx-selfsigned.key

RUN openssl req -x509 -nodes -days 356 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj /C=DE/ST=Heilbronn/L=Heilbronn/O=wordpress/CN=$DOMAIN

#COPY run.sh /run.sh
#RUN chmod +x /run.sh
CMD  ["nginx", "-g", "daemon off;"]

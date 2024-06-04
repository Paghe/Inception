FROM debian:bullseye

RUN apt update \
    && apt upgrade -y \
    && apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY expand.sh .
COPY init.sql /etc/mysql/init/sql
RUN chmod 777 /etc/mysql/init/sql
COPY script.sh .
RUN mkdir /run/mysqld && chmod +x script.sh
RUN  chmod +x expand.sh
CMD  ["./expand.sh"]
#CMD  ["tail", "-f", "/dev/null"]

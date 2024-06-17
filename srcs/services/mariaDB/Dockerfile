FROM debian:bullseye

# Install MariaDB server
RUN apt-get update -y \
	&& apt-get upgrade \
	&& apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysqld \
	 && chmod 777 /run/mysqld \
	&& mkdir -p var/lib/mysql \
	&& chmod 777 var/lib/mysql

COPY expand.sh init.sh
RUN chmod +x init.sh
# Expose MariaDB port
EXPOSE 3306

# Run the initialization script during container startup
#CMD ["/bin/bash"]
CMD ["./init.sh"]

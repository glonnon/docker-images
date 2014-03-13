FROM base:latest
MAINTAINER greg.lonnon@gmail.com

# FIXME: security issue, no password

# install mysql
RUN apt-get -y install mysql-server mysql-client

# configure mysql

RUN echo "[mysqld]"                       >/etc/mysql/conf.d/docker.cnf
RUN echo "bind-address   = 0.0.0.0"      >>/etc/mysql/conf.d/docker.cnf
RUN echo "innodb_flush_method = O_DSYNC" >>/etc/mysql/conf.d/docker.cnf
RUN echo "skip-name-resolve"             >>/etc/mysql/conf.d/docker.cnf
RUN echo "init_file = /etc/mysql/init"   >>/etc/mysql/conf.d/docker.cnf
RUN echo "GRANT ALL ON *.* TO root@'%'" >/etc/mysql/init

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]

# start it up using...
# CID=$(docker run -d -v /home/msyql/data:/data -p 27017:27017 mongodb:latest)
# client connect: mysql -u root -p -h localhost -P 3306 --protocol=tcp
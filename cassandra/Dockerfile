FROM openjdk-7:latest
MAINTAINER greg.lonnon@gmail.com

RUN gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
RUN gpg --export --armor F758CE318D77295D | apt-key add -
RUN gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
RUN gpg --export --armor 2B5C1B00 | apt-key add -

RUN echo "deb http://www.apache.org/dist/cassandra/debian 11x main" > /etc/apt/sources.list.d/cassandra.list
RUN echo "deb-src http://www.apache.org/dist/cassandra/debian 11x main" >> /etc/apt/sources.list.d/cassandra.list

sudo apt-get update

RUN apt-get update 
RUN apt-get -y install cassandra

CMD ["/usr/sbin/cassandra", "-f"] 
FROM openjdk-7:latest
MAINTAINER greg.lonnon@gmail.com

# install openjdk
RUN apt-get -y install wget

# install tomcat 7.0.52
RUN wget -O /tmp/tomcat7.tar.gz http://www.eng.lsu.edu/mirrors/apache/tomcat/tomcat-7/v7.0.52/bin/apache-tomcat-7.0.52.tar.gz

RUN cd opt && tar zxf /tmp/tomcat7.tar.gz
ADD ./run.sh /usr/local/bin/run
EXPOSE 8080 8443
CMD ["/bin/sh","-e","/usr/local/bin/run"]


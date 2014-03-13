FROM base:latest
MAINTAINER greg.lonnon@gmail.com

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" > /etc/apt/sources.list.d/10gen.list
RUN apt-get update 
RUN apt-get install -y mongodb-10gen
ENTRYPOINT [“mongod”, “-f”, “/data/mongodb.conf”]

# start it up using...
# CID=$(docker run -d -v /home/mongodb/data:/data -p 27017:27017 mongodb:latest)
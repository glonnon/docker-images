.PHONY:  mongodb mysql cassandra rabbitmq base tomcat7 openjdk-7

all:  base mongodb mysql rabbitmq openjdk-7 tomcat7 cassandra 

base: 
	cd base; sudo docker build -t base:latest .

mongodb mysql rabbitmq openjdk-7: base
	cd $@; sudo docker build -t $@:latest .

tomcat7 cassandra : openjdk-7
	cd $@; sudo docker build -t $@:latest .

clean-all:
	-sudo docker ps -q | sudo xargs docker kill 
	-sudo docker ps -a -q | sudo xargs docker rm

# this is nuclear...  don't do this...
clean-images: clean-all
	-sudo docker images -q | sudo xargs docker rmi

docker:
	sudo apt-get update
	sudo apt-get install linux-image-extra-`uname -r`
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
	sudo apt-get update
	sudo apt-get install lxc-docker

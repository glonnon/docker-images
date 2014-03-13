#################################################################
# This docker image build file creates an image that contains
# the queueing middleware RabbitMQ
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# Component:    RabbitMQ
# Author:       Alex Oberhauser <alex.oberhauser@networld.to>
# Copyright:    (c) 2013-2014 Sigimera Ltd. All rights reserved.
#################################################################
FROM base:latest
MAINTAINER greg.lonnon@gmail.com

# Reduce output from debconf

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get install -y wget
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc
RUN apt-get -y update

# Docker work around for upstart: [https://github.com/dotcloud/docker/issues/1024]
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management

ADD add_user.sh /tmp/
RUN /tmp/add_user.sh  

# For RabbitMQ and RabbitMQ Adminm
EXPOSE 5672 15672

ENTRYPOINT ["/usr/sbin/rabbitmq-server"]
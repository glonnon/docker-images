service rabbitmq-server restart
rabbitmqctl add_user root root
rabbitmqctl set_user_tags root administrator
service rabbitmq-server stop

# Setup
SHELL = /bin/zsh
.PHONY : default_target
default_target: up

# Docker Images
ERROR  = stepbrobd/error:latest
SERVE  = stepbrobd/serve:latest
YELLOW = stepbrobd/yellow:latest

update:
	sudo apt     update  -y
	sudo apt     upgrade -y
	sudo apt-get update  -y
	sudo apt-get upgrade -y

pull:
	sudo docker pull $(ERROR)
	sudo docker pull $(SERVE)
	sudo docker pull $(YELLOW)

link:
	ln -fsv /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

verify:
	nginx -t

up: pull link verify
	sudo docker run -d -p 10000:10000 $(ERROR)
	sudo docker run -d -p 10001:10001 $(SERVE)
	sudo docker run -d -p 10002:10002 $(YELLOW)
	sudo systemctl restart nginx

down:
	sudo docker rm $(docker ps -a -q)

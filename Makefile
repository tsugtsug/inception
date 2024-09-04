# Name of the project
NAME = inception

# The file path of Docker Compose
COMPOSE_FILE = srcs/docker-compose.yml

# default
all: build up

# build
build:
	@ docker-compose -f $(COMPOSE_FILE) build

# up
up:
	@ docker-compose -f $(COMPOSE_FILE) up -d

# stop
stop:
	@ docker-compose -f $(COMPOSE_FILE) down

# logs
logs:
	@ docker-compose -f $(COMPOSE_FILE) logs -f

# clean
clean: stop
	@ docker-compose -f $(COMPOSE_FILE) rm -f
	@ docker system prune -f

# reload
reload: clean build up

# status
status:
	@ docker-compose -f $(COMPOSE_FILE) ps

# clean-volumes
clean-volumes:
	@ docker-compose -f $(COMPOSE_FILE) down -v

# clean-images
clean-images:
	@ docker rmi $$(docker images -q)

# clean data directories
data:
	sudo rm -r /home/yokamura/data/mariadb
	sudo rm -r /home/yokamura/data/wordpress
	mkdir /home/yokamura/data/wordpress /home/yokamura/data/mariadb

.PHONY: all build up stop logs clean reload status clean-volumes clean-images data

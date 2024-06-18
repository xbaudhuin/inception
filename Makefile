RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
BLUE = \033[1;34m
RESET = \033[0m

all:		build

build:
	mkdir -p ${HOME}/data
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down -v

kill:
	docker compose -f ./srcs/docker-compose.yml kill

rm_volume:
	sudo rm -rf ${HOME}/data/wordpress
	sudo rm -rf ${HOME}/data/mariadb

fclean: clean rm_volume 
	docker system prune -a -f

log:
	@printf "${YELLOW}Nginx logs:${RESET}\n"
	@docker compose -f ./srcs/docker-compose.yml logs nginx
	@printf "${YELLOW}\n\nMariadb logs:${RESET}\n"
	@docker compose -f ./srcs/docker-compose.yml logs mariadb
	@printf "${YELLOW}\n\nWorpress logs:${RESET}\n"
	@docker compose -f ./srcs/docker-compose.yml logs wordpress

restart: clean build

.PHONY: 	all build down clean kill fclean restart

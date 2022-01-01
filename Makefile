FILENAME = "srcs/docker-compose.yml"

all:	up

build:
	docker-compose -f $(FILENAME) build

up:
	docker-compose -f $(FILENAME) up

start:
	docker-compose -f $(FILENAME) start

down:
	docker-compose -f $(FILENAME) down

kill:
	docker-compose -f $(FILENAME) kill

stop:
	docker-compose -f $(FILENAME) stop

ps:
	docker-compose -f $(FILENAME) ps

re:	stop up

clean:
	docker-compose -f $(FILENAME) down -v --rmi -a

fclean:




.PHONY:	all re clean fclean build up start down kill stop ps


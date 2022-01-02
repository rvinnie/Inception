FILENAME = "srcs/docker-compose.yml"

RM = rm -rf

VOLUME_DIRS = /home/rvinnie/data/mariadb /home/rvinnie/data/wordpress 

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

fclean:	clean
	$(RM) $(VOLUME_DIRS)
	mkdir $(VOLUME_DIRS)



.PHONY:	all re clean fclean build up start down kill stop ps


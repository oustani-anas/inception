
SRC = srcs/docker-compose.yml

all: up

up:
	mkdir -p /Users/aoustani/Desktop/incep/db
	mkdir -p /Users/aoustani/Desktop/incep/wp
	docker-compose -f $(SRC) up --build -d

fclean:
	docker-compose -f $(SRC) down
	docker system prune -f -all --volumes
	rm -rf /Users/aoustani/Desktop/incep/wp
	rm -rf /Users/aoustani/Desktop/incep/db
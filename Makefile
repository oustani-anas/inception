
SRC = srcs/docker-compose.yml

all: up

up:
	mkdir -p /Users/aoustani/Desktop/db
	mkdir -p /Users/aoustani/Desktop/wp
	docker-compose -f $(SRC) up --build -d

down:
	docker-compose -f $(SRC) down
	docker system prune -f --all --volumes
	rm -rf /Users/aoustani/Desktop/wp
	rm -rf /Users/aoustani/Desktop/db

stop:
	docker-compose -f $(SRC) stop
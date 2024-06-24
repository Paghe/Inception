NAME := Inception

COMPOSE := srcs/docker-compose.yml

check-env:
	@if [ ! -f srcs/.env ]; then \
		if [ -f /home/apaghera/.env ]; then \
			mv /home/apaghera/.env srcs/.env; \
			echo ".env file moved from /home/apaghera to srcs directory"; \
		else \
			echo "provide a .env file for docker-compose"; \
			exit 1; \
		fi \
	else \
		echo "file .env exists in srcs directory"; \
	fi


build: check-env
		@echo "Building $(NAME)..."
		docker-compose -f $(COMPOSE) build

up: check-env
		@echo "Starting $(NAME)..."
		docker-compose -f $(COMPOSE) up -d

down:
		@echo "Stopping and removing Docker containers for $(NAME)..."
		docker-compose -f $(COMPOSE) down

start:
		@echo "Starting $(NAME)..."
		docker-compose -f $(COMPOSE) start

stop:
		@echo "Stopping Docker for $(NAME)..."
		docker-compose -f $(COMPOSE) stop

clean:		
		@echo "Clearing the cache for $(NAME)..."
		docker system prune -a -f

re:
		docker-compose -f $(COMPOSE) down
		docker system prune -a -f
		docker-compose -f $(COMPOSE) up -d
logs:
		@echo "Viewing logs of Docker for $(NAME)..."
		docker-compose -f $(COMPOSE) logs

status:
		@echo "Displaying status of Docker containers for $(NAME)..."
		docker-compose -f $(COMPOSE) ps

all: build up

.PHONY : build up down start stop logs status all

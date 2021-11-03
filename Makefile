SHELL := /bin/bash
MAKE_FILE := $(lastword $(MAKEFILE_LIST))
NAME = mountebank-devops
.PHONY: help

help: ## run this command for help with the different commands
	@grep -E '^[a-zA-Z_-]+:.*?##' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## this command builds the mountebank docker image and lists all images currently
	docker build -t $(NAME):latest .
	docker image ls

run: ## this runs the locally built image
	docker run --rm -p 5000:2525 $(NAME)

stop: ## stop and remove the container
	 docker stop $$(docker ps -qf "ancestor=mountebank-devops")

list: ## List of running containers
	docker ps

exec: ## execute the docker container
	docker exec -it  $$(docker ps -qf "ancestor=mountebank-devops") sh


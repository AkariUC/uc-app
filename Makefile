COMPOSE=docker-compose
EXEC=$(COMPOSE) exec
BUILD=$(COMPOSE) build
UP=$(COMPOSE) up -d
LOGS=$(COMPOSE) logs
STOP=$(COMPOSE) stop
RM=$(COMPOSE) rm
DOWN=$(COMPOSE) down
API=$(EXEC) tornado
DB=$(EXEC) tornado-db
MYSQL:=mysql --defaults-extra-file=/home/access.cnf

all: docker/up

docker/build: ## docker build
	$(BUILD)

docker/up: ## docker up
	$(UP)

docker/logs: ## docker logs
	$(LOGS)

docker/stop: ## docker stop
	$(STOP)

docker/clean: ## docker clean
	$(RM)

docker/down: ## docker down
	$(DOWN)

py/bash: ## python container bash
	$(API) bash

db/bash: ## db(MySQL) container bash
	$(DB) bash

mysql: ## access mysql
	$(DB) $(MYSQL)

help: ## Display this help screen
	@grep -E '^[a-zA-Z/_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


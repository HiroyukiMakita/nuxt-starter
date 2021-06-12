# --------------------------------------------------------------- imports
include .env
APP_NAME := ${APP_NAME}
PROJECT_ROOT := ${ROOT}
GIT_USER_NAME := ${GIT_USER_NAME}

# ------------------------------------------------------------- variables
COMPOSE := docker-compose
BUILD := $(COMPOSE) build
LOGS := $(COMPOSE) logs
UP := $(COMPOSE) up -d
DOWN := $(COMPOSE) down
EXEC = $(COMPOSE) exec $(CONTAINER) bash $(ARG)
CONTAINER =
ARG = 

# docker services
NUXT := nuxt

# --------------------------------------------------------- make commands
build:
	@$(BUILD)
logs:
	@$(LOGS)
build-up:
	@$(BUILD) && $(UP)
up:
	@$(UP)
down:
	@$(DOWN)
destroy:
	@$(DOWN) --rmi all --volumes --remove-orphans
exec-nuxt:
	$(eval CONTAINER := $(NUXT))
	$(eval ARG := -c "cd $(PROJECT_ROOT) && bash")
	@$(EXEC)
create-nuxt-app-current:
	$(eval CONTAINER := $(NUXT))
	$(eval ARG := -c "\
	cd $(PROJECT_ROOT) && \
	docker/web/create-nuxt-app.sh $(APP_NAME) && \
	cat $(APP_NAME)/.gitignore >> .gitignore && \
	shopt -s dotglob && \
	mv -n $(APP_NAME)/* . && \
	shopt -u dotglob && \
	rm -r $(APP_NAME)\
	")
	@$(EXEC)
nuxt-app-destroy:
	$(eval CONTAINER := $(NUXT))
	$(eval ARG := -c "\
	cd $(PROJECT_ROOT) && \
	rm -r .nuxt/ .circleci/ assets/ components/ layouts/ middleware/ node_modules/ pages/ plugins/ static/ store/ test/ .babelrc .editorconfig .eslintrc.js .prettierrc *config.js* package* tsconfig* ; \
	cat .gitignore.example > .gitignore\
	")
	@$(EXEC)
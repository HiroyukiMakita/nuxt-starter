#!/usr/bin/env bash
source /var/www/html/docker/.env
GIT_USER_NAME=${GIT_USER_NAME}
APP_NAME=$1

# https://github.com/nuxt/create-nuxt-app/blob/master/packages/create-nuxt-app/lib/prompts.js
NUXT_APP_RECIPE=$(cat << EOS
{
	"name": "$APP_NAME",
	"language": "ts",
	"pm": "npm",
	"ui": "vuetify",
	"server": "none",
	"features": ["axios", "pwa"],
	"linter": ["eslint", "prettier"],
	"test": "jest",
	"mode": "universal",
	"target": "server",
	"devTools": "jsconfig.json",
	"ci": "circleci",
	"gitUsername": "$GIT_USER_NAME",
	"vcs": "git"
}
EOS
)

npx create-nuxt-app $APP_NAME --answers "$NUXT_APP_RECIPE"

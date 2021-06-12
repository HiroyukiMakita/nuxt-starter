# nuxt-starter

## description

This repository is for create Nuxt.js application in docker-compose.

## build && up

Create env file.
Edit `.env` file after run this command.

```
# run in docker directory
$ cd docker

$ cat .env.example > .env
```

Run build.

```
# run in docker directory
$ cd docker

# if can use make command
$ make build

# or

# few no use make command
$ docker-compose build
```

Up docker-compose.

```
# run in docker directory
$ cd docker

# if can use make command
$ make up

# or

# few no use make command
$ docker-compose up -d
```

## create new nuxt project in project root <br>(run in container)

```
# run in docker directory
$ cd docker

# if can use make command
$ make create-nuxt-app-current

# or

# few no use make command
$ APP_NAME=YOUR_APP_NAME && \
  docker-compose exec nuxt bash -c "\
  cd /var/www/html && \
  docker/web/create-nuxt-app.sh $APP_NAME && \
  cat $APP_NAME/.gitignore >> .gitignore && \
  shopt -s dotglob && \
  mv -n $APP_NAME/* . && \
  shopt -u dotglob && \
  rm -r $APP_NAME"
```

## nuxt app start in develop environment

Access [http://127.0.0.1:3000](http://127.0.0.1:3000) after run this command.

```
$ npm run dev
```

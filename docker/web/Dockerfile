ARG BASE_IMAGE
ARG PROJECT_ROOT

FROM node:${BASE_IMAGE}

WORKDIR ${PROJECT_ROOT}

COPY create-nuxt-app.sh ${PROJECT_ROOT}/docker/web/create-nuxt-app.sh

RUN apk update && \
    apk add bash vim && \
    npm install -g create-nuxt-app && \
    chmod 0744 ${PROJECT_ROOT}/docker/web/create-nuxt-app.sh
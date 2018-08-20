FROM node:alpine as jss-cli

RUN npm -g install @sitecore-jss/sitecore-jss-cli

FROM jss-cli as install

ARG NODE_ENV

ENV NODE_ENV=${NODE_ENV:-Production}

WORKDIR /src

COPY package*.json ./

RUN npm install

ENTRYPOINT [ "jss" ]

FROM install as build

# TODO Maybe not everything needs to be copied
COPY ./ ./

COPY --from=install /src/node_modules/ /app/node_modules/

RUN jss build

FROM nginx:alpine as app

COPY --from=build /src/build/ /usr/share/nginx/html
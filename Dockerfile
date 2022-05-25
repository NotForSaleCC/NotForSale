FROM elixir:alpine

COPY docker-entrypoint.sh /

ENTRYPOINT ["sh", "./docker-entrypoint.sh"]

ENV MIX_ENV=dev

RUN apk add postgresql-client inotify-tools nodejs build-base bash

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new --force

WORKDIR /app

COPY . .

EXPOSE 4000

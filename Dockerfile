FROM elixir:alpine

ENV MIX_ENV=dev

RUN apk add postgresql-client inotify-tools nodejs build-base

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new --force

WORKDIR /app
EXPOSE 4000

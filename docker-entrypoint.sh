#!/bin/ash

set -e

str=`date -Ins | md5sum`
name=${str:0:10}

mix phx.digest
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs

# elixir --sname $name --cookie monster -S mix phx.server
iex -S mix phx.server

exec "$@"
defmodule Notforsale.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Notforsale.Repo,
      # Start the Telemetry supervisor
      NotforsaleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Notforsale.PubSub},
      # Start the Endpoint (http/https)
      NotforsaleWeb.Endpoint,
      # Start a worker by calling: Notforsale.Worker.start_link(arg)
      # {Notforsale.Worker, arg}
      {
        Tortoise.Connection,
        [
          client_id: Notforsale,
          server: {Tortoise.Transport.Tcp, host: System.get_env("MOSQUITTO_SERVER") || "localhost", port: 1883},
          user_name: System.get_env("MOSQUITTO_USERNAME") || "notforsale",
          password: System.get_env("MOSQUITTO_PASSWORD") || "notforsale",
          handler: {
            Tortoise.Handler.Logger, []
          }
        ]
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Notforsale.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NotforsaleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

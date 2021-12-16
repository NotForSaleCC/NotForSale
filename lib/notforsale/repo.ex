defmodule Notforsale.Repo do
  use Ecto.Repo,
    otp_app: :notforsale,
    adapter: Ecto.Adapters.Postgres
end

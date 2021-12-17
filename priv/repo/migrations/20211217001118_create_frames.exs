defmodule Notforsale.Repo.Migrations.CreateFrames do
  use Ecto.Migration

  def change do
    create table(:frames) do
      add :client_id, :string
      add :topic, :string

      timestamps()
    end
  end
end

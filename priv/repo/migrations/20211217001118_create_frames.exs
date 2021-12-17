defmodule Notforsale.Repo.Migrations.CreateFrames do
  use Ecto.Migration

  def change do
    create table(:frames) do
      add :client_id, :string
      add :topic, :string
      add :exec, :text
      add :user_id, references(:users)

      timestamps()
    end
  end
end

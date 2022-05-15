defmodule Notforsale.Repo.Migrations.AddUniqueIndexToFrames do
  use Ecto.Migration

  def change do
    create unique_index(:frames, :topic)
  end
end

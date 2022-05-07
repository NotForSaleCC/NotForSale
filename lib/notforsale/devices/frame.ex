defmodule Notforsale.Devices.Frame do
  use Ecto.Schema
  import Ecto.Changeset

  schema "frames" do
    field :client_id, :string
    field :topic, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(frame, attrs) do
    frame
    |> cast(attrs, [:client_id, :topic, :user_id])
    |> validate_required([:client_id, :topic, :user_id])
  end
end

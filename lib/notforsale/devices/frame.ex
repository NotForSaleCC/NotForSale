defmodule Notforsale.Devices.Frame do
  use Ecto.Schema
  import Ecto.Changeset

  schema "frames" do
    field :client_id, :string
    field :topic, :string

    timestamps()
  end

  @doc false
  def changeset(frame, attrs) do
    frame
    |> cast(attrs, [:client_id, :topic])
    |> validate_required([:client_id, :topic])
  end
end

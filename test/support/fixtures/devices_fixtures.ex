defmodule Notforsale.DevicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Notforsale.Devices` context.
  """

  @doc """
  Generate a frame.
  """
  def frame_fixture(attrs \\ %{}) do
    {:ok, frame} =
      attrs
      |> Enum.into(%{
        client_id: "some client_id",
        topic: "some topic"
      })
      |> Notforsale.Devices.create_frame()

    frame
  end
end

defmodule NotforsaleWeb.Api.V1.FrameView do
  use NotforsaleWeb, :view
  alias NotforsaleWeb.Api.V1.FrameView

  def render("index.json", %{frames: frames}) do
    %{data: render_many(frames, FrameView, "frame.json")}
  end

  def render("show.json", %{frame: frame}) do
    %{data: render_one(frame, FrameView, "frame.json")}
  end

  def render("frame.json", %{frame: frame}) do
    %{
      id: frame.id,
      client_id: frame.client_id,
      topic: frame.topic
    }
  end
end

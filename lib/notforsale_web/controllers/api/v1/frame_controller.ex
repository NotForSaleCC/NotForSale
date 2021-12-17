defmodule NotforsaleWeb.Api.V1.FrameController do
  use NotforsaleWeb, :controller

  alias Notforsale.Devices
  alias Notforsale.Devices.Frame

  action_fallback NotforsaleWeb.FallbackController

  def index(conn, _params) do
    frames = Devices.list_frames()
    render(conn, "index.json", frames: frames)
  end

  def create(conn, %{"frame" => frame_params}) do
    frame_params = Map.merge(frame_params, %{"user_id" => conn.assigns.current_user.id})

    with {:ok, %Frame{} = frame} <- Devices.create_frame(frame_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_v1_frame_path(conn, :show, frame))
      |> render("show.json", frame: frame)
    end
  end

  def show(conn, %{"id" => id}) do
    frame = Devices.get_frame!(id)
    render(conn, "show.json", frame: frame)
  end

  def update(conn, %{"id" => id, "frame" => frame_params}) do
    frame = Devices.get_frame!(id)

    with {:ok, %Frame{} = frame} <- Devices.update_frame(frame, frame_params) do
      render(conn, "show.json", frame: frame)
    end
  end

  def delete(conn, %{"id" => id}) do
    frame = Devices.get_frame!(id)

    with {:ok, %Frame{}} <- Devices.delete_frame(frame) do
      send_resp(conn, :no_content, "")
    end
  end
end

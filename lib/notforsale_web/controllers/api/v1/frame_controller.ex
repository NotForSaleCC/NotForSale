defmodule NotforsaleWeb.Api.V1.FrameController do
  use NotforsaleWeb, :controller

  alias Notforsale.Devices
  alias Notforsale.Devices.Frame

  action_fallback NotforsaleWeb.FallbackController

  def index(conn, _params) do
    frames = Devices.list_frames(conn.assigns.current_user)
    render(conn, "index.json", frames: frames)
  end

  def create(conn, %{"frame" => frame_params}) do
    with {:ok, %Frame{} = frame} <- Devices.create_frame(frame_params, conn.assigns.current_user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_v1_frame_path(conn, :show, frame))
      |> render("show.json", frame: frame)
    end
  end

  def show(conn, %{"id" => id}) do
    frame = get_frame!(conn, id)

    render(conn, "show.json", frame: frame)
  end

  def update(conn, %{"id" => id, "frame" => frame_params}) do
    frame = get_frame!(conn, id)

    with {:ok, %Frame{} = frame} <- Devices.update_frame(frame, frame_params) do
      render(conn, "show.json", frame: frame)
    end
  end

  def delete(conn, %{"id" => id}) do
    frame = get_frame!(conn, id)

    with {:ok, %Frame{}} <- Devices.delete_frame(frame) do
      send_resp(conn, :no_content, "")
    end
  end

  def print(conn, %{"client_id" => client_id, "image_url" => image_url, "action" => action}) do
    frame = Devices.get_frame_by_client_id!(client_id, conn.assigns.current_user)
    message = %{image: image_url, action: action} |> Poison.encode!

    Tortoise.publish(Notforsale, "#{frame.client_id}/print", message, qos: 2)
    json(conn, %{ status: :ok })
  end

  defp get_frame!(conn, id) do
    Devices.get_frame!(id, conn.assigns.current_user)
  end
end

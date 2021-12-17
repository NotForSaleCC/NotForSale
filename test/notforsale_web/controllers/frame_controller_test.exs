defmodule NotforsaleWeb.FrameControllerTest do
  use NotforsaleWeb.ConnCase

  import Notforsale.DevicesFixtures

  alias Notforsale.Devices.Frame

  @create_attrs %{
    client_id: "some client_id",
    topic: "some topic"
  }
  @update_attrs %{
    client_id: "some updated client_id",
    topic: "some updated topic"
  }
  @invalid_attrs %{client_id: nil, topic: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all frames", %{conn: conn} do
      conn = get(conn, Routes.frame_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create frame" do
    test "renders frame when data is valid", %{conn: conn} do
      conn = post(conn, Routes.frame_path(conn, :create), frame: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.frame_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "client_id" => "some client_id",
               "topic" => "some topic"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.frame_path(conn, :create), frame: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update frame" do
    setup [:create_frame]

    test "renders frame when data is valid", %{conn: conn, frame: %Frame{id: id} = frame} do
      conn = put(conn, Routes.frame_path(conn, :update, frame), frame: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.frame_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "client_id" => "some updated client_id",
               "topic" => "some updated topic"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, frame: frame} do
      conn = put(conn, Routes.frame_path(conn, :update, frame), frame: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete frame" do
    setup [:create_frame]

    test "deletes chosen frame", %{conn: conn, frame: frame} do
      conn = delete(conn, Routes.frame_path(conn, :delete, frame))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.frame_path(conn, :show, frame))
      end
    end
  end

  defp create_frame(_) do
    frame = frame_fixture()
    %{frame: frame}
  end
end

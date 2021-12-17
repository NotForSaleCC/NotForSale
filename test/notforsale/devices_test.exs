defmodule Notforsale.DevicesTest do
  use Notforsale.DataCase

  alias Notforsale.Devices

  describe "frames" do
    alias Notforsale.Devices.Frame

    import Notforsale.DevicesFixtures

    @invalid_attrs %{client_id: nil, topic: nil}

    test "list_frames/0 returns all frames" do
      frame = frame_fixture()
      assert Devices.list_frames() == [frame]
    end

    test "get_frame!/1 returns the frame with given id" do
      frame = frame_fixture()
      assert Devices.get_frame!(frame.id) == frame
    end

    test "create_frame/1 with valid data creates a frame" do
      valid_attrs = %{client_id: "some client_id", topic: "some topic"}

      assert {:ok, %Frame{} = frame} = Devices.create_frame(valid_attrs)
      assert frame.client_id == "some client_id"
      assert frame.topic == "some topic"
    end

    test "create_frame/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Devices.create_frame(@invalid_attrs)
    end

    test "update_frame/2 with valid data updates the frame" do
      frame = frame_fixture()
      update_attrs = %{client_id: "some updated client_id", topic: "some updated topic"}

      assert {:ok, %Frame{} = frame} = Devices.update_frame(frame, update_attrs)
      assert frame.client_id == "some updated client_id"
      assert frame.topic == "some updated topic"
    end

    test "update_frame/2 with invalid data returns error changeset" do
      frame = frame_fixture()
      assert {:error, %Ecto.Changeset{}} = Devices.update_frame(frame, @invalid_attrs)
      assert frame == Devices.get_frame!(frame.id)
    end

    test "delete_frame/1 deletes the frame" do
      frame = frame_fixture()
      assert {:ok, %Frame{}} = Devices.delete_frame(frame)
      assert_raise Ecto.NoResultsError, fn -> Devices.get_frame!(frame.id) end
    end

    test "change_frame/1 returns a frame changeset" do
      frame = frame_fixture()
      assert %Ecto.Changeset{} = Devices.change_frame(frame)
    end
  end
end

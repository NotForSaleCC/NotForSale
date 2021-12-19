defmodule Notforsale.Devices do
  @moduledoc """
  The Devices context.
  """

  import Ecto.Query, warn: false
  alias Notforsale.Repo

  alias Notforsale.Devices.Frame

  @doc """
  Returns the list of frames.

  ## Examples

      iex> list_frames()
      [%Frame{}, ...]

  """
  def list_frames(user) do
    query = from f in Frame, where: f.user_id == ^user.id
    Repo.all(query)
  end

  @doc """
  Gets a single frame.

  Raises `Ecto.NoResultsError` if the Frame does not exist.

  ## Examples

      iex> get_frame!(123)
      %Frame{}

      iex> get_frame!(456)
      ** (Ecto.NoResultsError)

  """
  def get_frame!(id, user), do: Repo.get_by!(Frame, [id: id, user_id: user.id])
  def get_frame_by_client_id!(client_id, user) do
    query =
      from f in Frame,
      where: f.user_id == ^user.id and f.client_id == ^client_id,
      limit: 1

    Repo.one(query)
  end

  @doc """
  Creates a frame.

  ## Examples

      iex> create_frame(%{field: value})
      {:ok, %Frame{}}

      iex> create_frame(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_frame(attrs \\ %{}, user) do
    attrs = Map.merge(attrs, %{"user_id" => user.id})

    %Frame{}
    |> Frame.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a frame.

  ## Examples

      iex> update_frame(frame, %{field: new_value})
      {:ok, %Frame{}}

      iex> update_frame(frame, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_frame(%Frame{} = frame, attrs) do
    frame
    |> Frame.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a frame.

  ## Examples

      iex> delete_frame(frame)
      {:ok, %Frame{}}

      iex> delete_frame(frame)
      {:error, %Ecto.Changeset{}}

  """
  def delete_frame(%Frame{} = frame) do
    Repo.delete(frame)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking frame changes.

  ## Examples

      iex> change_frame(frame)
      %Ecto.Changeset{data: %Frame{}}

  """
  def change_frame(%Frame{} = frame, attrs \\ %{}) do
    Frame.changeset(frame, attrs)
  end
end

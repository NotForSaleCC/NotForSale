defmodule NotforsaleWeb.Api.V1.UserRegistrationController do
  use NotforsaleWeb, :controller

  alias Notforsale.Accounts
  alias Notforsale.Accounts.User
  alias NotforsaleWeb.Guardian

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->

        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :edit, &1)
          )

          {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, %{})
        conn
        |> put_status(:created)
        |> render("create.json", user: user, jwt: jwt)

      {:error, %Ecto.Changeset{} = changeset} ->

        conn
        |> put_status(401)
        |> render("error.json", message: changeset)
    end
  end
end

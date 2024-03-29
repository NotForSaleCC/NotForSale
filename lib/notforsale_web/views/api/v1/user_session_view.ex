defmodule NotforsaleWeb.Api.V1.UserSessionView do
  use NotforsaleWeb, :view

  def render("create.json", %{user: user, jwt: jwt}) do
    %{
    status: :ok,
    data: %{
      token: jwt,
      email: user.email
      },
      message: "You are successfully logged in! Add this token to authorization header to make authorized requests."
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :not_found,
      data: %{},
      message: message
    }
  end
end

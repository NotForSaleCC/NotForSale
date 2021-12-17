
defmodule NotforsaleWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :notforsale,
                              module: NotforsaleWeb.Guardian,
                              error_handler: NotforsaleWeb.Guardian.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
end

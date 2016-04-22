defmodule WhichConfig.HomeController do
  use WhichConfig.Web, :controller

  alias WhichConfig.Home

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

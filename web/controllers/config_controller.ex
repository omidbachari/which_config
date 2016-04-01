defmodule WhichConfig.ConfigController do
  use WhichConfig.Web, :controller

  alias WhichConfig.Config

  plug :scrub_params, "config" when action in [:create, :update]

  def index(conn, _params) do
    configs = Repo.all(Config)
    render(conn, "index.json", configs: configs)
  end
end

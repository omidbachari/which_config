defmodule WhichConfig.ConfigController do
  use WhichConfig.Web, :controller

  alias WhichConfig.Config

  plug :scrub_params, "config" when action in [:create, :update]

  def index(conn, _params) do
    configs = Repo.all(Config)
    render(conn, "index.json", configs: configs)
  end

  def show(conn, %{"id" => id}) do
    config = Repo.get!(Config, id)
    render(conn, "show.json", config: config)
  end

  def create(conn, %{"config" => config_params}) do
    changeset = Config.changeset(%Config{}, config_params)

    case Repo.insert(changeset) do
      {:ok, config} ->
        conn
        |> put_status(:created)
        |> render("show.json", config: config)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", changeset: changeset)
    end
  end
end

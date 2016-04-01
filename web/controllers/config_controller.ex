defmodule WhichConfig.ConfigController do
  use WhichConfig.Web, :controller

  alias WhichConfig.Config

  plug :scrub_params, "config" when action in [:create, :update]

  def index(conn, _params) do
    configs = Repo.all(Config)
    render(conn, "index.html", configs: configs)
  end

  def new(conn, _params) do
    changeset = Config.changeset(%Config{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"config" => config_params}) do
    changeset = Config.changeset(%Config{}, config_params)

    case Repo.insert(changeset) do
      {:ok, _config} ->
        conn
        |> put_flash(:info, "Config created successfully.")
        |> redirect(to: config_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    config = Repo.get!(Config, id)
    render(conn, "show.html", config: config)
  end

  def edit(conn, %{"id" => id}) do
    config = Repo.get!(Config, id)
    changeset = Config.changeset(config)
    render(conn, "edit.html", config: config, changeset: changeset)
  end

  def update(conn, %{"id" => id, "config" => config_params}) do
    config = Repo.get!(Config, id)
    changeset = Config.changeset(config, config_params)

    case Repo.update(changeset) do
      {:ok, config} ->
        conn
        |> put_flash(:info, "Config updated successfully.")
        |> redirect(to: config_path(conn, :show, config))
      {:error, changeset} ->
        render(conn, "edit.html", config: config, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    config = Repo.get!(Config, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(config)

    conn
    |> put_flash(:info, "Config deleted successfully.")
    |> redirect(to: config_path(conn, :index))
  end
end

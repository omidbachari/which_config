defmodule WhichConfig.Router do
  use WhichConfig.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhichConfig do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
  end

  scope "/api", WhichConfig do
    pipe_through :api

    resources "configs", ConfigController, only: [:index, :show, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", WhichConfig do
  #   pipe_through :api
  # end
end

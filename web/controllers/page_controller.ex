defmodule WhichConfig.PageController do
  use WhichConfig.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

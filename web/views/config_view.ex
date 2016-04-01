defmodule WhichConfig.ConfigView do
  use WhichConfig.Web, :view

  def render("index.json", %{configs: configs}) do
    %{configs: configs}
  end
end

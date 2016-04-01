defmodule WhichConfig.ConfigView do
  use WhichConfig.Web, :view

  def render("index.json", %{configs: configs}) do
    %{configs: configs}
  end

  def render("show.json", %{config: config}) do
    %{config: config}
  end

  def render("error.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {field, detail} ->
      %{} |> Map.put(field, detail)
    end)

    %{
      errors: errors
    }
  end
end

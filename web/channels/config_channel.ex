defmodule WhichConfig.ConfigChannel do
  use WhichConfig.Web, :channel

  def join("configs:lobby", payload, socket) do
    {:ok, socket}
  end

  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  def broadcast_change(config) do
    payload = %{
      "owner" => config.owner,
      "config_handle" => config.config_handle
    }

    WhichConfig.Endpoint.broadcast("Configs", "change", payload)
  end
end

defmodule WhichConfig.ConfigChannelTest do
  use WhichConfig.ChannelCase

  alias WhichConfig.ConfigChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(ConfigChannel, "configs:lobby")

    {:ok, socket: socket}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end

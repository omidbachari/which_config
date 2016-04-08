defmodule WhichConfig.ConfigTest do
  use WhichConfig.ModelCase

  alias WhichConfig.Config

  @valid_attrs %{config_handle: "some content", owner: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Config.changeset(%Config{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Config.changeset(%Config{}, @invalid_attrs)
    refute changeset.valid?
  end
end

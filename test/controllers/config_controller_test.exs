defmodule WhichConfig.ConfigControllerTest do
  use WhichConfig.ConnCase

  alias WhichConfig.Config
  @valid_attrs %{config_handle: "some content", owner: "some content"}
  @invalid_attrs %{}

  test "respond with all configs at root", %{conn: conn} do
    configs_as_json =
      %Config{config_handle: "spacemacs", owner: "Adam Robinson"}
      |> Repo.insert
    conn = get conn, config_path(conn, :index)

    assert Poison.decode!(conn.resp_body)["configs"] === [%{"config_handle" => "spacemacs", "owner" => "Adam Robinson"}]
    assert json_response(conn, 200)
  end

  test "creates resource and returns record when data is valid", %{conn: conn} do
    conn = post conn, config_path(conn, :create), config: @valid_attrs
    assert json_response(conn, 201)
    assert Poison.decode!(conn.resp_body)["config"] === %{"config_handle" => "some content", "owner" => "some content"}
    assert Repo.get_by(Config, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, config_path(conn, :create), config: @invalid_attrs
    assert json_response(conn, 422)
    assert Poison.decode!(conn.resp_body) === %{"errors" => [%{"owner" => "can't be blank"}, %{"config_handle" => "can't be blank"}]}
  end

  test "shows chosen resource", %{conn: conn} do
    config =
      %Config{config_handle: "spacemacs", owner: "Adam Robinson"}
      |> Repo.insert
    conn = get conn, config_path(conn, :show, elem(config,1).id)

    assert json_response(conn, 200)
    assert Poison.decode!(conn.resp_body)["config"] === %{"config_handle" => "spacemacs", "owner" => "Adam Robinson"}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, config_path(conn, :show, -1)
    end
  end
end

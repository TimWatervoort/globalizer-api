defmodule GlobalizerApiWeb.RegionControllerTest do
  use GlobalizerApiWeb.ConnCase

  alias GlobalizerApi.Directory
  alias GlobalizerApi.Directory.Region

  @create_attrs %{
    continent: "some continent",
    label: "some label",
    name: "some name"
  }
  @update_attrs %{
    continent: "some updated continent",
    label: "some updated label",
    name: "some updated name"
  }
  @invalid_attrs %{continent: nil, label: nil, name: nil}

  def fixture(:region) do
    {:ok, region} = Directory.create_region(@create_attrs)
    region
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all regions", %{conn: conn} do
      conn = get(conn, Routes.region_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create region" do
    test "renders region when data is valid", %{conn: conn} do
      conn = post(conn, Routes.region_path(conn, :create), region: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.region_path(conn, :show, id))

      assert %{
               "id" => id,
               "continent" => "some continent",
               "label" => "some label",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.region_path(conn, :create), region: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update region" do
    setup [:create_region]

    test "renders region when data is valid", %{conn: conn, region: %Region{id: id} = region} do
      conn = put(conn, Routes.region_path(conn, :update, region), region: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.region_path(conn, :show, id))

      assert %{
               "id" => id,
               "continent" => "some updated continent",
               "label" => "some updated label",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, region: region} do
      conn = put(conn, Routes.region_path(conn, :update, region), region: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete region" do
    setup [:create_region]

    test "deletes chosen region", %{conn: conn, region: region} do
      conn = delete(conn, Routes.region_path(conn, :delete, region))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.region_path(conn, :show, region))
      end
    end
  end

  defp create_region(_) do
    region = fixture(:region)
    {:ok, region: region}
  end
end

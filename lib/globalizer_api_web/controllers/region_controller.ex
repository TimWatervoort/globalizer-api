defmodule GlobalizerApiWeb.RegionController do
  use GlobalizerApiWeb, :controller

  alias GlobalizerApi.Directory
  alias GlobalizerApi.Directory.Region

  action_fallback GlobalizerApiWeb.FallbackController

  def index(conn, _params) do
    regions = Directory.list_regions()
    render(conn, "index.json", regions: regions)
  end

  def create(conn, %{"region" => region_params}) do
    with {:ok, %Region{} = region} <- Directory.create_region(region_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.region_path(conn, :show, region))
      |> render("show.json", region: region)
    end
  end

  def show(conn, %{"id" => id}) do
    region = Directory.get_region!(id)
    render(conn, "show.json", region: region)
  end

  def update(conn, %{"id" => id, "region" => region_params}) do
    region = Directory.get_region!(id)

    with {:ok, %Region{} = region} <- Directory.update_region(region, region_params) do
      render(conn, "show.json", region: region)
    end
  end

  def delete(conn, %{"id" => id}) do
    region = Directory.get_region!(id)

    with {:ok, %Region{}} <- Directory.delete_region(region) do
      send_resp(conn, :no_content, "")
    end
  end
end

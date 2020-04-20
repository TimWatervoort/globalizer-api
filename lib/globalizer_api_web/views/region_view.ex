defmodule GlobalizerApiWeb.RegionView do
  use GlobalizerApiWeb, :view
  alias GlobalizerApiWeb.RegionView
  alias GlobalizerApiWeb.Content.Curator

  def render("index.json", %{regions: regions}) do
    %{data: render_many(regions, RegionView, "region.json")}
  end

  def render("show.json", %{region: region}) do
    %{data: render_one(region, RegionView, "one_region.json")}
  end

  def render("region.json", %{region: region}) do
    %{
      id: region.id,
      name: region.name,
      label: region.label,
      continent: region.continent
    }
  end

  def render("one_region.json", %{region: region}) do
    %{
      id: region.id,
      name: region.name,
      label: region.label,
      continent: region.continent,
      content: Curator.get_content(region)
    }
  end
end

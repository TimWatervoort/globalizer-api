defmodule GlobalizerApiWeb.Content.Curator do
  def assemble_content(region) do
    content_map = %{}
    add_language_content(content_map, region)
    |> add_geography_content(region)
  end

  # Language content functions
  def add_language_content(content_map, region) do
    Map.put(content_map, :language_content, assemble_language_content(region))
  end

  defp assemble_language_content(region) do
    language_map = %{}
    get_language(language_map, region)
    |> get_hello(region)
    |> get_goodbye(region)
  end

  defp get_hello(language_map, region) do
    Map.put(language_map, :hello, region.content_hello)
  end

  defp get_goodbye(language_map, region) do
    Map.put(language_map, :goodbye, region.content_goodbye)
  end

  defp get_language(language_map, region) do
    Map.put(language_map, :language, region.content_language)
  end

  # Geography content functions
  def add_geography_content(content_map, region) do
    Map.put(content_map, :geography_content, assemble_geography_content(region))
  end

  defp assemble_geography_content(region) do
    geography_map = %{}
    get_capital(geography_map, region)
    |> get_major_cities(region)
  end

  defp get_capital(geography_map, region) do
    Map.put(geography_map, :capital, region.content_capital)
  end

  defp get_major_cities(geography_map, region) do
    Map.put(geography_map, :major_cities, region.content_major_cities)
  end

  # Region specific functions
  def get_content (region) do
    case region.name do
      "greater_sweden" ->
        get_greater_sweden_content()
      "usa_colorado" ->
        get_usa_colorado_content()
      "usa_louisiana" ->
        get_usa_louisiana_content()
      _ ->
        raise "No content for this region."
    end
  end

  def get_greater_sweden_content do
    alias GlobalizerApiWeb.Content.Regions.GreaterSweden
    assemble_content(GreaterSweden)
  end

  def get_usa_colorado_content do
    alias GlobalizerApiWeb.Content.Regions.UsaColorado
    assemble_content(UsaColorado)
  end

  def get_usa_louisiana_content do
    alias GlobalizerApiWeb.Content.Regions.UsaLouisiana
    assemble_content(UsaLouisiana)
  end

end

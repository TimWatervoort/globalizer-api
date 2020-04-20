defmodule GlobalizerApi.DirectoryTest do
  use GlobalizerApi.DataCase

  alias GlobalizerApi.Directory

  describe "regions" do
    alias GlobalizerApi.Directory.Region

    @valid_attrs %{continent: "some continent", label: "some label", name: "some name"}
    @update_attrs %{continent: "some updated continent", label: "some updated label", name: "some updated name"}
    @invalid_attrs %{continent: nil, label: nil, name: nil}

    def region_fixture(attrs \\ %{}) do
      {:ok, region} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_region()

      region
    end

    test "list_regions/0 returns all regions" do
      region = region_fixture()
      assert Directory.list_regions() == [region]
    end

    test "get_region!/1 returns the region with given id" do
      region = region_fixture()
      assert Directory.get_region!(region.id) == region
    end

    test "create_region/1 with valid data creates a region" do
      assert {:ok, %Region{} = region} = Directory.create_region(@valid_attrs)
      assert region.continent == "some continent"
      assert region.label == "some label"
      assert region.name == "some name"
    end

    test "create_region/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_region(@invalid_attrs)
    end

    test "update_region/2 with valid data updates the region" do
      region = region_fixture()
      assert {:ok, %Region{} = region} = Directory.update_region(region, @update_attrs)
      assert region.continent == "some updated continent"
      assert region.label == "some updated label"
      assert region.name == "some updated name"
    end

    test "update_region/2 with invalid data returns error changeset" do
      region = region_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_region(region, @invalid_attrs)
      assert region == Directory.get_region!(region.id)
    end

    test "delete_region/1 deletes the region" do
      region = region_fixture()
      assert {:ok, %Region{}} = Directory.delete_region(region)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_region!(region.id) end
    end

    test "change_region/1 returns a region changeset" do
      region = region_fixture()
      assert %Ecto.Changeset{} = Directory.change_region(region)
    end
  end
end

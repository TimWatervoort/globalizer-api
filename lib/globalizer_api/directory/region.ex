defmodule GlobalizerApi.Directory.Region do
  use Ecto.Schema
  import Ecto.Changeset

  schema "regions" do
    field :continent, :string
    field :label, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(region, attrs) do
    region
    |> cast(attrs, [:name, :label, :continent])
    |> validate_required([:name, :label, :continent])
  end
end

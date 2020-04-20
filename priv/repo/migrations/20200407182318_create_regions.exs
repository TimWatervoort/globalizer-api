defmodule GlobalizerApi.Repo.Migrations.CreateRegions do
  use Ecto.Migration

  def change do
    create table(:regions) do
      add :name, :string
      add :lalabel, :string
      add :continent, :string

      timestamps()
    end

  end
end

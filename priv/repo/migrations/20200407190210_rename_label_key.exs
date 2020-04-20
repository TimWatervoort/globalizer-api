defmodule GlobalizerApi.Repo.Migrations.RenameLabelKey do
  use Ecto.Migration

  def change do
    rename table(:regions), :lalabel, to: :label
  end
end

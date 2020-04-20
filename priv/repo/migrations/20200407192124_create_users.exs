defmodule GlobalizerApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :encrypted_password, :string
      add :location, :string
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end

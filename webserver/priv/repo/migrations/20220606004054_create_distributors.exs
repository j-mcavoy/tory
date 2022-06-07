defmodule Tory.Repo.Migrations.CreateDistributors do
  use Ecto.Migration

  def change do
    create table(:distributors) do
      add(:name, :string)
      add(:website, :string)

      timestamps()
    end

    create(unique_index(:distributors, [:name]))
  end
end

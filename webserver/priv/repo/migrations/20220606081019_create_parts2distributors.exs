defmodule Tory.Repo.Migrations.CreateParts2distributors do
  use Ecto.Migration

  def change do
    create table(:parts2distributors) do
      add(:part_id, references(:parts))
      add(:distributor_id, references(:distributors))

      timestamps()
    end
  end
end

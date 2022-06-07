defmodule Tory.Repo.Migrations.CreateParts2parameters do
  use Ecto.Migration

  def change do
    create table(:parts2parameters) do
      add(:part_id, references(:parts))
      add(:parameter_id, references(:parameters))

      timestamps()
    end
  end
end

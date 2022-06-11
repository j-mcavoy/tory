defmodule Tory.Repo.Migrations.CreateParts2parameters do
  use Ecto.Migration

  def change do
    create table(:parts2parameters) do
      add(:part_id, references(:parts))
      add(:parameter_id, references(:parameters))

      timestamps()
    end

    create(index(:parts2parameters, [:part_id]))
    create(index(:parts2parameters, [:parameter_id]))
    create(unique_index(:parts2parameters, [:parameter_id, :part_id]))
  end
end

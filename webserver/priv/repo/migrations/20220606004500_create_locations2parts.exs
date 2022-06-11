defmodule Tory.Repo.Migrations.CreateLocation2part do
  use Ecto.Migration

  def change do
    create table(:locations2parts) do
      add(:part_id, references(:parts, on_delete: :nothing))
      add(:location_id, references(:locations, on_delete: :nothing))
      add(:quantity, :integer)

      timestamps()
    end

    create(index(:locations2parts, [:part_id]))
    create(index(:locations2parts, [:location_id]))
    create(unique_index(:locations2parts, [:part_id, :location_id]))
  end
end

defmodule Tory.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add(:count, :integer)
      add(:part_id, references(:parts, on_delete: :nothing))
      add(:location_id, references(:locations, on_delete: :nothing))

      timestamps()
    end

    unique_index(:inventories, [:part_id, :location_id])
  end
end

defmodule Tory.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:stocks) do
      add(:count, :integer)
      add(:part_id, references(:parts, on_delete: :nothing))
      add(:location_id, references(:locations, on_delete: :nothing))

      timestamps()
    end

    create(index(:stocks, [:part_id]))
    create(index(:stocks, [:location_id]))
  end
end

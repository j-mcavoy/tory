defmodule Tory.Repo.Migrations.CreatePartlocations do
  use Ecto.Migration

  def change do
    create table(:partlocations) do
      add(:count, :integer)
      add(:part_id, references(:parts, on_delete: :nothing))
      add(:location_id, references(:locations, on_delete: :nothing))

      timestamps()
    end

    create(index(:partlocations, [:part_id]))
    create(index(:partlocations, [:location_id]))
  end
end

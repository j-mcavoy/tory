defmodule Tory.Repo.Migrations.CreateLocation2part do
  use Ecto.Migration

  def change do
    create table(:locations2parts) do
      add(:part_id, references(:parts, on_delete: :nothing))
      add(:location_id, references(:locations, on_delete: :nothing))
      add(:quantity, :integer)

      timestamps()
    end
  end
end

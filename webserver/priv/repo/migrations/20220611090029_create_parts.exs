defmodule Tory.Repo.Migrations.CreateParts do
  use Ecto.Migration

  def change do
    create table(:parts) do
      add(:mpn, :string)
      add(:datasheet, :string)
      add(:barcode, :string)
      add(:octopart_uuid, :uuid)
      add(:description, :string)

      timestamps()
    end

    create(unique_index(:parts, [:mpn]))
  end
end
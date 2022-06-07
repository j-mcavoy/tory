defmodule Tory.Repo.Migrations.CreateParts do
  use Ecto.Migration

  def change do
    create table(:parts) do
      add(:mpn, :string)
      add(:description, :string)
      add(:datasheet, :string)
      add(:barcode, :string)
      add(:octopart_id, :string)
      add(:price_usd, :integer)
      add(:manufacturer_id, references(:manufacturers))

      timestamps()
    end
  end
end

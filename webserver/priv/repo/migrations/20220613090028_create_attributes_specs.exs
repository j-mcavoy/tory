defmodule Tory.Repo.Migrations.CreateAttributeSpecs do
  use Ecto.Migration

  def change do
    create table(:specs) do
      add(:display_value, :string)
      add(:value, :string)
      add(:units, :string)

      add(:part_id, references(:parts, on_replace: :delete_all, on_delete: :delete_all))

      timestamps()
    end

    create table(:attributes) do
      add(:name, :string)
      add(:shortname, :string)
      add(:group, :string)

      add(:spec_id, references(:specs, on_replace: :delete_all, on_delete: :delete_all))
      timestamps()
    end
  end
end

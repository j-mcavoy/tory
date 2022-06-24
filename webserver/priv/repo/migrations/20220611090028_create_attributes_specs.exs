defmodule Tory.Repo.Migrations.CreateAttributeSpecs do
  use Ecto.Migration

  def change do
    create table(:attributes) do
      add(:name, :string, null: false)
      add(:shortname, :string)
      add(:group, :string)

      timestamps()
    end

    create(unique_index(:attributes, [:name, :shortname, :group]))

    create table(:specs) do
      add(:attribute_id, references(:attributes))
      add(:display_value, :string)
      add(:value, :string)
      add(:units, :string)

      timestamps()
    end

    create(index(:specs, [:attribute_id]))
  end
end

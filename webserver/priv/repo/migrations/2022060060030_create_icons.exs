defmodule Tory.Repo.Migrations.CreateIcons do
  use Ecto.Migration

  def change do
    create table(:icons) do
      add(:icon, :string)

      timestamps()
    end

    create(unique_index(:icons, [:icon]))
  end
end

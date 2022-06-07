defmodule Tory.Repo.Migrations.CreateParts2manufacturers do
  use Ecto.Migration

  def change do
    create table(:parts2manufacturers) do
      add(:part, references(:parts))
      add(:manufacturer, references(:manufacturers))

      timestamps()
    end
  end
end

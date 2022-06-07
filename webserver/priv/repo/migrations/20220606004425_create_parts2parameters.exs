defmodule Tory.Repo.Migrations.CreateParts2parameters do
  use Ecto.Migration

  def change do
    create table(:parts2parameters) do
      add(:part, references(:parts))
      add(:parameter, references(:parameters))

      timestamps()
    end
  end
end

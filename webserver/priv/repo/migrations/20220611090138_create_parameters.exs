defmodule Tory.Repo.Migrations.CreateParameters do
  use Ecto.Migration

  def change do
    create table(:parameters) do
      add :name, :string
      add :value, :string

      timestamps()
    end
  end
end

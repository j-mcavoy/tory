defmodule Tory.Repo.Migrations.CreatePartparameters do
  use Ecto.Migration

  def change do
    create table(:partparameters) do
      add :part_id, references(:part, on_delete: :nothing)
      add :parameter_id, references(:parameter, on_delete: :nothing)

      timestamps()
    end

    create index(:partparameters, [:part_id])
    create index(:partparameters, [:parameter_id])
  end
end

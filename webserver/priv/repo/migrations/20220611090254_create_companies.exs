defmodule Tory.Repo.Migrations.Companies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add(:octopart_id, :string)
      add(:name, :string, null: false)
      add(:display_flag, :string)
      add(:homepage_url, :string)
      add(:slug, :string)
      add(:is_verified, :bool)
      add(:is_distributorapi, :bool)

      timestamps()
    end

    create table(:company_aliases) do
      add(:alias, :string, null: false)
      add(:company_id, references(:companies))
      timestamps()
    end

    create(unique_index(:company_aliases, [:company_id, :alias]))
  end
end

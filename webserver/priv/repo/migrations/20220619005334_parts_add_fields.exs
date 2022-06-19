defmodule Tory.Repo.Migrations.PartsAddFields do
  use Ecto.Migration

  def change do
    alter table(:parts) do
      add(:distributor_url, :string)
      add(:mpn_extended, :string)
    end
  end
end

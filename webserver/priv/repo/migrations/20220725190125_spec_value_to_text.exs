defmodule Tory.Repo.Migrations.SpecValueToText do
  use Ecto.Migration

  def change do
    alter table("specs") do
      modify(:display_value, :text)
      modify(:value, :text)
    end
  end
end

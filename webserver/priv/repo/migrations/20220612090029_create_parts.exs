defmodule Tory.Repo.Migrations.CreateParts do
  use Ecto.Migration

  def change do
    create table(:parts) do
      add(:mpn, :string)
      add(:octopart_id, :string)
      add(:name, :string)
      add(:generic_mpn, :string)
      add(:manufacturer_url, :text)
      add(:free_sample_url, :text)
      add(:short_description, :text)
      add(:slug, :string)
      add(:octopart_url, :string)
      add(:series, :text)
      add(:image, :string)
      add(:datasheet, :text)
      add(:cad_request_url, :text)
      add(:total_avail, :integer)
      add(:avg_avail, :float)
      add(:estimated_factory_lead_days, :integer)
      add(:barcode, :text)
      add(:company_id, references(:companies))
      timestamps()
    end

    create table(:aka_mpn) do
      add(:mpn, :string, null: false)
      add(:part_id, references(:parts))
      timestamps()
    end

    create(unique_index(:aka_mpn, [:mpn, :part_id]))

    create table(:part_specs) do
      add(:part_id, references(:parts, on_delete: :delete_all))
      add(:spec_id, references(:specs, on_delete: :delete_all))
      timestamps()
    end

    create(unique_index(:part_specs, [:part_id, :spec_id]))
  end
end

defmodule Tory.Part.Part do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Repo

  alias Tory.Inventory.Inventory
  alias Tory.Company.Company
  alias Tory.Part.Spec

  schema "parts" do
    field(:mpn, :string)
    field(:octopart_id, :string)
    field(:name, :string)
    field(:generic_mpn, :string)
    field(:manufacturer_url, :string)
    field(:free_sample_url, :string)
    field(:short_description, :string)
    field(:slug, :string)
    field(:octopart_url, :string)
    field(:series, :string)
    field(:image, :string)
    field(:datasheet, :string)
    field(:cad_request_url, :string)
    field(:total_avail, :integer)
    field(:avg_avail, :float)
    field(:estimated_factory_lead_days, :integer)
    field(:barcode, :string)

    belongs_to :company, Company, on_replace: :update
    has_many :inventories, Inventory, on_replace: :delete, on_delete: :delete_all
    has_many :specs, Spec, on_replace: :delete, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(part, attrs \\ %{}) do
    part
    |> cast(
      attrs,
      ~w(mpn octopart_id name generic_mpn manufacturer_url free_sample_url short_description slug octopart_url series image datasheet cad_request_url total_avail avg_avail estimated_factory_lead_days barcode)a
    )
    |> cast_assoc(:company)
    |> cast_assoc(:specs)
    |> cast_assoc(:inventories)
  end
end

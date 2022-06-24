defmodule Tory.Part.Part do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Repo

  alias Tory.Inventory.Stock
  alias Tory.Company.Company
  alias Tory.Meta.Spec
  alias Tory.Part.PartSpec

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

    belongs_to :company, Company
    has_many :stocks, Stock
    many_to_many :specs, Spec, join_through: PartSpec

    timestamps()
  end

  @doc false
  def changeset(part, attrs \\ %{}) do
    part
    |> cast(
      attrs,
      ~w(mpn octopart_id name generic_mpn manufacturer_url free_sample_url short_description slug octopart_url series image datasheet cad_request_url total_avail avg_avail estimated_factory_lead_days barcode)a
    )
    # |> put_assoc(:stocks, with: Stock)
    |> put_assoc(:company, get_or_insert_company(attrs))
    # |> cast_assoc(:stocks, with: Stock)
    # |> put_assoc(:specs, with: Spec)
    |> unique_constraint(:octopart_id)
  end

  def company_changeset(part, attrs \\ %{}) do
    part
    |> put_assoc(:company, Company)
  end

  defp get_or_insert_company(%{name: name} = company) do
    IO.inspect(company)

    Repo.get_by(Company, name: name) ||
      Company.changeset(%Company{}, company)
      |> Repo.insert_or_update()
  end

  defp get_or_insert_specs(%{name: name} = spec) do
    IO.inspect(spec)

    Repo.get_by(Spec, name: name) ||
      Spec.changeset(%Spec{}, spec)
      |> Repo.insert_or_update()
  end
end

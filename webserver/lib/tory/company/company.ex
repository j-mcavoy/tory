defmodule Tory.Company.Company do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Repo
  alias Tory.Company.CompanyAlias
  alias Tory.Part.Part

  schema "companies" do
    field(:octopart_id, :string)
    field(:name, :string)
    field(:display_flag, :string)
    field(:homepage_url, :string)
    field(:slug, :string)
    field(:is_verified, :boolean)
    field(:is_distributorapi, :boolean)

    has_many :aliases, CompanyAlias, on_replace: :delete
    has_many :parts, Part

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(
      attrs,
      ~w(octopart_id name display_flag homepage_url slug is_verified is_distributorapi)a
    )
    |> cast_assoc(:aliases)
    |> validate_required(:name)
  end
end

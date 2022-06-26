defmodule Tory.Company.CompanyAlias do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Company.Company

  schema "company_aliases" do
    field :alias, :string

    belongs_to :company, Company

    timestamps()
  end

  #  def changeset([company_alias], attrs), do: Enum.map(company_alias, &changeset(&1, attrs))

  def changeset(company_alias, attrs) do
    company_alias
    |> cast(attrs, [:alias])
    |> cast_assoc(:company)
    |> validate_required([:alias])
    |> unique_constraint([:alias, :company])
  end
end

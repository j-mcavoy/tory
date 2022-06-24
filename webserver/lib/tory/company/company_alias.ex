defmodule Tory.Company.CompanyAlias do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Company.Company
  alias Tory.Part.Part

  schema "company_aliases" do
    field :alias, :string
    belongs_to :company, Company
    timestamps
  end

  def changeset(company_alias, attrs) do
    company_alias
    |> cast(attrs, [:alias, :company])
    |> validate_required([:alias])
    |> unique_constraint([:alias, :company])
  end
end

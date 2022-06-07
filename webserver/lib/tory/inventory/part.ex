defmodule Tory.Inventory.Part do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Manufacturer
  alias Tory.Inventory.Distributor
  alias Tory.Inventory.Location
  alias Tory.Inventory.Parameter

  schema "parts" do
    field(:barcode, :string)
    field(:datasheet, :string)
    field(:description, :string)
    field(:mpn, :string)
    field(:octopart_id, :string)
    field(:price_usd, :integer)
    belongs_to(:manufacturer, Manufacturer)
    many_to_many(:location_id, Location, join_through: :locations2parts)
    many_to_many(:distributor_id, Distributor, join_through: :parts2distributors)
    many_to_many(:parameter_id, Parameter, join_through: :parts2parameters)

    timestamps()
  end

  @doc false
  def changeset(part, attrs) do
    part
    |> cast(attrs, [:mpn])
    |> validate_required([:mpn])
  end
end

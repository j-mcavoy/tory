defmodule Tory.Inventory.Part do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Manufacturer
  alias Tory.Inventory.Distributor
  alias Tory.Inventory.Location
  alias Tory.Inventory.Parameter
  alias Tory.Inventory.Locations2Parts
  alias Tory.Inventory.Parts2Distributors
  alias Tory.Inventory.Parts2Parameters

  schema "parts" do
    field(:barcode, :string)
    field(:datasheet, :string)
    field(:description, :string)
    field(:mpn, :string)
    field(:octopart_no, :string)
    field(:price_usd, :integer)
    belongs_to(:manufacturer, Manufacturer)
    many_to_many(:locations, Location, join_through: Locations2Parts)
    many_to_many(:distributors, Distributor, join_through: Parts2Distributors)
    many_to_many(:parameters, Parameter, join_through: Parts2Parameters)

    timestamps()
  end

  @doc false
  def changeset(part, attrs) do
    part
    |> cast(
      attrs,
      ~w(barcode datasheet description mpn octopart_no price_usd )a
    )
    |> cast_assoc(:manufacturer)
    |> cast_assoc(:locations)
    |> cast_assoc(:distributors)
    |> cast_assoc(:parameters)
    |> validate_required([])
  end
end

defmodule Tory.Inventory.Locations2Parts do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.{Location, Part}

  schema "locations2parts" do
    belongs_to(:location, Location)
    belongs_to(:part, Part)
    field(:quantity, :integer)

    timestamps()
  end

  @doc false
  def changeset(locations2parts, attrs) do
    locations2parts
    |> cast(attrs, [:location, :part, :quantity])
    |> validate_required([:location, :part, :quantity])
  end
end

defmodule Tory.Inventory.PartLocation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Inventory.{Part, Location}

  schema "partlocations" do
    field :count, :integer
    belongs_to :part, Part
    belongs_to :location, Location

    timestamps()
  end

  @doc false
  def changeset(part_location, attrs) do
    part_location
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end

defmodule Tory.Inventory.Stock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Inventory.{Part, Location}

  schema "stocks" do
    field :count, :integer
    belongs_to :part, Part
    belongs_to :location, Location

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end

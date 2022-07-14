defmodule Tory.Inventory.Inventory do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Part.Part
  alias Tory.Inventory.Location

  schema "inventories" do
    field :count, :integer
    belongs_to :part, Part, on_replace: :delete
    belongs_to :location, Location, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end

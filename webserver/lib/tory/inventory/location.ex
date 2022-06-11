defmodule Tory.Inventory.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Inventory.Locations2Parts

  schema "locations" do
    field(:description, :string)
    field(:name, :string)

    many_to_many(:parts, Tory.Inventory.Part, join_through: Locations2Parts)

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end

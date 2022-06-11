defmodule Tory.Inventory.Location do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Part
  alias Tory.Inventory.PartLocation

  schema "locations" do
    field :description, :string
    field :name, :string
    many_to_many :parts, Part, join_through: PartLocation

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

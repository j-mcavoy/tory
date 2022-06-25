defmodule Tory.Inventory.Location do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Inventory

  schema "locations" do
    field :description, :string
    field :name, :string
    has_many :inventories, Inventory

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end

defmodule Tory.Inventory.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :description, :string
    field :name, :string

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

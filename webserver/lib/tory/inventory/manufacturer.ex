defmodule Tory.Inventory.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Part

  schema "manufacturers" do
    field(:name, :string)
    field(:website, :string)

    many_to_many(:part, Part, join_through: :parts2manufacturers)

    timestamps()
  end

  @doc false
  def changeset(manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name, :website])
    |> validate_required([:name, :website])
    |> unique_constraint(:name)
  end
end

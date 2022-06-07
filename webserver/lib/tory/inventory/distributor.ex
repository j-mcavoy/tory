defmodule Tory.Inventory.Distributor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Part
  alias Tory.Inventory.Distributors2Parts

  schema "distributors" do
    field(:name, :string)
    field(:website, :string)
    many_to_many(:part_id, Part, join_through: :parts2distributors)

    timestamps()
  end

  @doc false
  def changeset(distributor, attrs) do
    distributor
    |> cast(attrs, [:name, :website])
    |> validate_required([:name, :website])
    |> unique_constraint(:name)
  end
end

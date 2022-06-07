defmodule Tory.Inventory.Parameter do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Part

  schema "parameters" do
    field(:name, :string)
    field(:unit, :string)
    field(:value, :string)

    many_to_many(:part_id, Part, join_through: :parts2parameters)

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:name, :value, :unit])
    |> validate_required([:name, :value, :unit])
    |> unique_constraint(:name)
  end
end

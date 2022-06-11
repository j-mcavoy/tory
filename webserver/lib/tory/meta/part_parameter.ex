defmodule Tory.Meta.PartParameter do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.Part
  alias Tory.Meta.Parameter

  schema "partparameters" do
    belongs_to :part, Part
    belongs_to :parameter, PartParameter

    timestamps()
  end

  @doc false
  def changeset(part_parameter, attrs) do
    part_parameter
    |> cast(attrs, [])
    |> validate_required([])
  end
end

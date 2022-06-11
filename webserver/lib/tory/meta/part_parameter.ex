defmodule Tory.Meta.PartParameter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "partparameters" do

    field :part_id, :id
    field :parameter_id, :id

    timestamps()
  end

  @doc false
  def changeset(part_parameter, attrs) do
    part_parameter
    |> cast(attrs, [])
    |> validate_required([])
  end
end

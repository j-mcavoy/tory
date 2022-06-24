defmodule Tory.Meta.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Attribute

  schema "specs" do
    has_one :attribute, Attribute
    field :value, :string
    field(:units, :string)
    field(:display_value, :string)

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:name, :value])
    |> cast_assoc(:attribue, attrs[:attribute])
    |> validate_required([:name, :value])
  end
end

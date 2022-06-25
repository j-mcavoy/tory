defmodule Tory.Meta.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Attribute

  schema "specs" do
    field :value, :string
    field(:units, :string)
    field(:display_value, :string)

    belongs_to :attribute, Attribute

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:units, :value, :display_value])
    |> cast_assoc(:attribute)
  end
end

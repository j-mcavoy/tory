defmodule Tory.Meta.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Attribute

  schema "specs" do
    has_one :attribute, Attribute, on_replace: :update
    field :value, :string
    field(:units, :string)
    field(:display_value, :string)

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:units, :value, :display_value])
    |> put_assoc(:attribue, attrs[:attribute])
    |> validate_required([:name, :value])
  end
end

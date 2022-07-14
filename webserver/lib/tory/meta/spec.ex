defmodule Tory.Meta.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Attribute
  alias Tory.Part.{Part, PartSpec}

  schema "specs" do
    field :value, :string
    field(:units, :string)
    field(:display_value, :string)

    has_one :attribute, Attribute
    belongs_to :part, Part

    timestamps()
  end

  @doc false
  def changeset(spec, attrs \\ %{}) do
    spec
    |> cast(attrs, [:units, :value, :display_value])
    |> cast_assoc(:part)
    |> cast_assoc(:attribute)
  end
end

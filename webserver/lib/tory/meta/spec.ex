defmodule Tory.Meta.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Attribute
  alias Tory.Part.{Part, PartSpec}

  schema "specs" do
    field :value, :string
    field(:units, :string)
    field(:display_value, :string)

    belongs_to :attribute, Attribute, on_replace: :update
    many_to_many :parts, Part, join_through: PartSpec, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(spec, attrs \\ %{}) do
    spec
    |> cast(attrs, [:units, :value, :display_value])
    |> cast_assoc(:attribute)
  end
end

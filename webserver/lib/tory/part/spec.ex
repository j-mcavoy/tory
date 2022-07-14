defmodule Tory.Part.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Part.Attribute
  alias Tory.Part.{Part, PartSpec}

  schema "specs" do
    field :value, :string
    field(:units, :string)
    field(:display_value, :string)

    has_one :attribute, Attribute, on_replace: :delete
    belongs_to :part, Part, on_replace: :delete

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

defmodule Tory.Part.Attribute do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Spec

  schema "attributes" do
    field(:name, :string)
    field(:shortname, :string)
    field(:group, :string)

    belongs_to(:spec, Spec, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(attribute, attrs \\ %{}) do
    IO.inspect(attribute)
    IO.inspect(attrs)

    attribute
    |> cast(attrs, ~w(name shortname group)a)
    |> cast_assoc(:spec)
  end
end

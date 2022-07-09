defmodule Tory.Meta.Attribute do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Meta.Spec

  schema "attributes" do
    field(:name, :string)
    field(:shortname, :string)
    field(:group, :string)

    has_many(:specs, Spec)

    timestamps()
  end

  @doc false
  def changeset(attribute, attrs \\ %{}) do
    IO.inspect(attribute)
    IO.inspect(attrs)

    attribute
    |> cast(attrs, ~w(name shortname group)a)
    |> unique_constraint(~w(name shortname group)a)
    |> validate_required([:name])
  end
end

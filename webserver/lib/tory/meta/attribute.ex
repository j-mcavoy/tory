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
  def changeset(part_parameter, attrs) do
    part_parameter
    |> cast(attrs, ~w(name shortname group)a)
    |> cast_assoc(:specs)
    |> unique_constraint(~w(name shortname group)a)
    # |> put_assoc(:specs, upsert_specs(attrs["specs"]))
    |> validate_required([:name])
  end

  def upsert_specs(specs) do
    IO.inspect(specs)
  end
end

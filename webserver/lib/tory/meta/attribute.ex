defmodule Tory.Meta.Attribute do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attributes" do
    field(:name, :string)
    field(:shortname, :string)
    field(:group, :string)

    timestamps()
  end

  @doc false
  def changeset(part_parameter, attrs) do
    part_parameter
    |> cast(attrs, ~w(name shortname group)a)
    |> unique_constraint(~w(name shortname group)a)
    |> validate_required([:name])
  end
end

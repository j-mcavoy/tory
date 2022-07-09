defmodule Tory.Part.PartSpec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Part.Part
  alias Tory.Meta.Spec

  schema "part_specs" do
    belongs_to :spec, Spec, on_replace: :delete
    belongs_to :part, Part, on_replace: :delete

    timestamps()
  end

  def changeset(spec, attrs) do
    spec
    |> cast_assoc(:part)
    |> cast_assoc(:spec)
    |> unique_constraint([:part_id, :spec_id])
  end
end

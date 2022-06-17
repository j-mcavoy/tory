defmodule Tory.Meta.Icon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icons" do
    field :icon, :string

    timestamps()
  end

  @doc false
  def changeset(icon, attrs) do
    icon
    |> cast(attrs, [:icon])
    |> validate_required([:icon])
    |> unique_constraint([:icon])
  end
end

defmodule Tory.Meta.Parameter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parameters" do
    field :name, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end

defmodule Tory.Inventory.Parts2Parameters do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tory.Inventory.{Part, Parameter}

  schema "parts2parameters" do
    belongs_to(:parameter, Parameter)
    belongs_to(:part, Part)

    timestamps()
  end

  @doc false
  def changeset(parts2parameters, attrs) do
    parts2parameters
    |> cast(attrs, [:part, :parameter])
    |> validate_required([:part, :parameter])
  end
end

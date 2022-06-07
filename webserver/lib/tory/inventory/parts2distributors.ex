defmodule Tory.Inventory.Parts2Distributors do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.{Part, Distributor}

  schema "parts2distributors" do
    belongs_to(:distributor, Distributor)
    belongs_to(:part, Part)

    timestamps()
  end

  @doc false
  def changeset(parts2_distributors, attrs) do
    parts2_distributors
    |> cast(attrs, [:part, :distributor])
    |> validate_required([:part, :distributor])
  end
end

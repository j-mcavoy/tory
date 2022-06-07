defmodule Tory.Inventory.Parts2Manufacturers do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.{Manufacturer, Part}

  @schema_prefix :inventories
  schema "parts2manufacturers" do
    field(:manufacturer_id, :id)
    field(:part_id, :id)
    has_many(:manufacturer, Manufacturer)
    has_many(:part, Part)

    timestamps()
  end

  @doc false
  def changeset(parts2manufacturers, attrs) do
    parts2manufacturers
    |> cast(attrs, [:part, :manufacturer])
    |> validate_required([:part, :manufacturer])
  end
end

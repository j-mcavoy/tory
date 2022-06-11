defmodule Tory.Inventory.Part do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parts" do
    field :barcode, :string
    field :datasheet, :string
    field :mpn, :string
    field :octopart_uid, :string

    timestamps()
  end

  @doc false
  def changeset(part, attrs) do
    part
    |> cast(attrs, [:mpn, :datasheet, :barcode, :octopart_uid])
    |> validate_required([:mpn, :datasheet, :barcode, :octopart_uid])
    |> unique_constraint(:octopart_uid)
    |> unique_constraint(:mpn)
  end
end

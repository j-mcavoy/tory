defmodule Tory.Inventory.Part do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Inventory.{Location, Inventory}

  schema "parts" do
    field :barcode, :string
    field :datasheet, :string
    field :description, :string
    field :mpn, :string
    field :octopart_uuid, :string
    has_many :inventories, Inventory

    timestamps()
  end

  @doc false
  def changeset(part, attrs) do
    part
    |> cast(attrs, ~w(mpn datasheet barcode octopart_uuid description)a)
    |> validate_required(~w(mpn)a)
    |> unique_constraint(:octopart_uuid)
    |> unique_constraint(:mpn)
  end
end
defmodule Tory.Part.AkaMpn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tory.Part.Part

  schema "aka_mpn" do
    field(:mpn, :string)
    belongs_to :part, Part
    timestamps()
  end

  @doc false
  def changeset(mpn, attrs) do
    mpn
    |> cast(attrs, ~w(mpn datasheet barcode octopart_uuid description)a)
    |> cast_assoc(:part, attrs[:part_id])
    |> validate_required(~w(mpn)a)
    |> unique_constraint(:octopart_uuid)
    |> unique_constraint(:mpn)
  end
end

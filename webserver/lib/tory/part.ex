defmodule Tory.Part do
  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Part
  alias Tory.Part.Part, as: P

  def list_parts, do: Repo.all(P)
  def get_part(id), do: Repo.get(P, id)
  def get_part!(id), do: Repo.get!(P, id)

  def change_part(%P{} = part, attrs \\ %{}), do: Part.changeset(part, attrs)

  def get_part_preloaded!(id),
    do:
      get_part!(id)
      |> Repo.preload(specs: [:attributes], inventories: [:location], company: [:aliases])

  def upsert_part(%{id: id} = part) do
    case get_part(id) do
      nil ->
        Repo.insert!(part)

      old_part ->
        change = Repo.preload(old_part, [:company]) |> Part.changeset(part)
        Repo.insert_or_update(change)
    end
  end

  alias Tory.Meta.Spec
  def list_specs, do: Repo.all(Spec)
  def get_spec(id), do: Repo.get(Spec, id)
  def get_spec!(id), do: Repo.get!(Spec, id)

  def create_part(attrs \\ %{}) do
    %P{}
    |> Part.changeset(attrs)
    |> Repo.insert()
  end
end

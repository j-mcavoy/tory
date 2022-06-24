defmodule Tory.Part do
  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Part.Part

  def list_parts, do: Repo.all(Part)
  def get_part(id), do: Repo.get(Part, id)
  def get_part!(id), do: Repo.get!(Part, id)

  def get_part_preloaded!(id),
    do: get_part!(id) |> Repo.preload([:specs, :stocks, company: [:aliases]])

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

  def upsert_spec(%{id: id, name: name} = spec) do
    case get_spec(id) do
      nil ->
        Repo.insert!(spec)

      old_spec ->
        change = Spec.changeset(old_spec, spec)
        Repo.insert_or_update(change)
    end
  end
end

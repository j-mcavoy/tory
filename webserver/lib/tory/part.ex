defmodule Tory.Part do
  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Part
  alias Tory.Part.Part, as: P

  def list_parts, do: Repo.all(P)
  def get_part(id), do: Repo.get(P, id)
  def get_part!(id), do: Repo.get!(P, id)

  def change_part(%P{} = part, attrs \\ %{}), do: P.changeset(part, attrs)

  def get_part_preloaded!(id) do
    get_part!(id)
    |> Repo.preload(specs: [:attribute], inventories: [:location], company: [:aliases])
  end

  alias Tory.Meta.Spec
  def list_specs, do: Repo.all(Spec)
  def get_spec(id), do: Repo.get(Spec, id)
  def get_spec!(id), do: Repo.get!(Spec, id)

  def create_part(attrs \\ %{}) do
    %P{}
    |> P.changeset(attrs)
    |> Repo.insert()
  end

  def update_part(%P{} = part, attrs) do
    part
    |> P.changeset(attrs)
    |> Repo.update()
  end
end

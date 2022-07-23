defmodule Tory.Inventory do
  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Inventory.Location

  def list_locations, do: Repo.all(Location)
  def get_location(id), do: Repo.get(Location, id)
  def get_location!(id), do: Repo.get!(Location, id)

  def change_location(%Location{} = location, attrs \\ %{}),
    do: Location.changeset(location, attrs)

  def delete_location(location), do: Repo.delete(location)
  def delete_location!(location), do: Repo.delete!(location)

  def get_location_preloaded!(id) do
    get_location!(id)
    |> Repo.preload(inventories: [:part])
  end

  alias Tory.Meta.Spec
  def list_specs, do: Repo.all(Spec)
  def get_spec(id), do: Repo.get(Spec, id)
  def get_spec!(id), do: Repo.get!(Spec, id)

  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  alias Tory.Inventory.Inventory, as: I

  def list_inventories, do: Repo.all(I)

  def list_inventories_preloaded,
    do: Enum.map(list_inventories(), &Repo.preload(&1, [:part, :location]))

  def get_inventory!(id), do: Repo.get!(I, id)
  def get_inventory_preloaded!(id), do: get_inventory!(id) |> Repo.preload([:part, :location])

  def create_inventory(attrs \\ %{}) do
    %I{}
    |> I.changeset(attrs)
    |> Repo.insert()
  end

  def update_inventory(%I{} = inventory, attrs) do
    inventory
    |> I.changeset(attrs)
    |> Repo.update()
  end

  def delete_inventory(%I{} = inventory) do
    Repo.delete(inventory)
  end

  def change_inventory(%I{} = inventory, attrs \\ %{}) do
    I.changeset(inventory, attrs)
  end

  def increment_inventory(id, amount \\ 1) do
    inventory = get_inventory!(id)

    inventory
    |> I.changeset(%{count: inventory.count + amount})
    |> Repo.update()
  end

  def decrement_inventory(id, amount \\ 1), do: increment_inventory(id, -amount)
end

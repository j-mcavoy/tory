defmodule Tory.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Inventory.{Part, Parameter, Parts2Parameters}

  def list_part do
    Repo.all(Part) |> Repo.preload([:manufacturer, :distributors, :parameters])
  end

  def get_part!(id),
    do: Repo.get!(Part, id) |> Repo.preload([:parameters, :manufacturer, :distributors])

  def create_part(attrs \\ %{}) do
    %Part{}
    |> Part.changeset(attrs)
    |> Repo.insert()
  end

  def update_part(%Part{} = part, attrs) do
    part
    |> Part.changeset(attrs)
    |> Repo.update()
  end

  def delete_part(%Part{} = part) do
    Repo.delete(part)
  end

  def change_part(%Part{} = part, attrs \\ %{}) do
    Part.changeset(part, attrs)
  end

  alias Tory.Inventory.Location

  def list_locations do
    Repo.all(Location)
  end

  def get_location!(id), do: Repo.get!(Location, id)

  def get_location_with_parts!(id) do
    Repo.get!(Location, id) |> Repo.preload(:parts)
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

  def change_location(%Location{} = location, attrs \\ %{}) do
    Location.changeset(location, attrs)
  end

  alias Tory.Inventory.Manufacturer

  def list_manufacturers do
    Repo.all(Manufacturer)
  end

  def get_manufacturer!(id), do: Repo.get!(Manufacturer, id)

  def create_manufacturer(attrs \\ %{}) do
    %Manufacturer{}
    |> Manufacturer.changeset(attrs)
    |> Repo.insert()
  end

  def update_manufacturer(%Manufacturer{} = manufacturer, attrs) do
    manufacturer
    |> Manufacturer.changeset(attrs)
    |> Repo.update()
  end

  def delete_manufacturer(%Manufacturer{} = manufacturer) do
    Repo.delete(manufacturer)
  end

  def change_manufacturer(%Manufacturer{} = manufacturer, attrs \\ %{}) do
    Manufacturer.changeset(manufacturer, attrs)
  end

  alias Tory.Inventory.Distributor

  def list_distributors do
    Repo.all(Distributor)
  end

  def get_distributor!(id), do: Repo.get!(Distributor, id)

  def create_distributor(attrs \\ %{}) do
    %Distributor{}
    |> Distributor.changeset(attrs)
    |> Repo.insert()
  end

  def update_distributor(%Distributor{} = distributor, attrs) do
    distributor
    |> Distributor.changeset(attrs)
    |> Repo.update()
  end

  def delete_distributor(%Distributor{} = distributor) do
    Repo.delete(distributor)
  end

  def change_distributor(%Distributor{} = distributor, attrs \\ %{}) do
    Distributor.changeset(distributor, attrs)
  end

  alias Tory.Inventory.Parameter

  def list_parameters do
    Repo.all(Parameter)
  end

  def get_parameter!(id), do: Repo.get!(Parameter, id)

  def create_parameter(attrs \\ %{}) do
    %Parameter{}
    |> Parameter.changeset(attrs)
    |> Repo.insert()
  end

  def update_parameter(%Parameter{} = parameter, attrs) do
    parameter
    |> Parameter.changeset(attrs)
    |> Repo.update()
  end

  def delete_parameter(%Parameter{} = parameter) do
    Repo.delete(parameter)
  end

  def change_parameter(%Parameter{} = parameter, attrs \\ %{}) do
    Parameter.changeset(parameter, attrs)
  end

  def add_parameter(part_id, parameter_id) do
    Parts2Parameters.changeset(%Parts2Parameters{}, %{
      part: part_id,
      parameter: parameter_id
    })
  end

  def generate_barcode(nil), do: ""
  def generate_barcode(""), do: ""

  def generate_barcode(%Part{barcode: b}) do
    generate_barcode(b)
  end

  def generate_barcode(b) do
    Barlix.Code128.encode!(b) |> Barlix.UTF.print()
  end
end

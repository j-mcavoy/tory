defmodule Tory.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tory.Inventory` context.
  """

  @doc """
  Generate a part.
  """
  def part_fixture(attrs \\ %{}) do
    {:ok, part} =
      attrs
      |> Enum.into(%{
        barcode: "some barcode",
        datasheet: "some datasheet",
        description: "some description",
        mpn: "some mpn",
        octopart_id: "some octopart_id",
        price_usd: 42
      })
      |> Tory.Inventory.create_part()

    part
  end

  @doc """
  Generate a unique location name.
  """
  def unique_location_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: unique_location_name()
      })
      |> Tory.Inventory.create_location()

    location
  end

  @doc """
  Generate a unique manufacturer name.
  """
  def unique_manufacturer_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a manufacturer.
  """
  def manufacturer_fixture(attrs \\ %{}) do
    {:ok, manufacturer} =
      attrs
      |> Enum.into(%{
        name: unique_manufacturer_name(),
        website: "some website"
      })
      |> Tory.Inventory.create_manufacturer()

    manufacturer
  end

  @doc """
  Generate a unique distributor name.
  """
  def unique_distributor_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a distributor.
  """
  def distributor_fixture(attrs \\ %{}) do
    {:ok, distributor} =
      attrs
      |> Enum.into(%{
        name: unique_distributor_name(),
        website: "some website"
      })
      |> Tory.Inventory.create_distributor()

    distributor
  end

  @doc """
  Generate a unique attribute name.
  """
  def unique_attribute_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a attribute.
  """
  def attribute_fixture(attrs \\ %{}) do
    {:ok, attribute} =
      attrs
      |> Enum.into(%{
        name: unique_attribute_name(),
        unit: "some unit",
        value: "some value"
      })
      |> Tory.Inventory.create_attribute()

    attribute
  end
end

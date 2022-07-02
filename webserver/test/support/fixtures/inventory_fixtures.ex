defmodule Tory.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tory.Inventory` context.
  """

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
  Generate a unique part mpn.
  """
  def unique_part_mpn, do: "some mpn#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique part octopart_uid.
  """
  def unique_part_octopart_uid, do: "some octopart_uid#{System.unique_integer([:positive])}"

  @doc """
  Generate a part.
  """
  def part_fixture(attrs \\ %{}) do
    {:ok, part} =
      attrs
      |> Enum.into(%{
        barcode: "some barcode",
        datasheet: "some datasheet",
        mpn: unique_part_mpn(),
        octopart_uid: unique_part_octopart_uid()
      })
      |> Tory.Inventory.create_part()

    part
  end

  @doc """
  Generate a part_location.
  """
  def part_location_fixture(attrs \\ %{}) do
    {:ok, part_location} =
      attrs
      |> Enum.into(%{
        count: 42
      })
      |> Tory.Inventory.create_part_location()

    part_location
  end

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Tory.Inventory.create_location()

    location
  end

  @doc """
  Generate a x_inventory.
  """
  def x_inventory_fixture(attrs \\ %{}) do
    {:ok, x_inventory} =
      attrs
      |> Enum.into(%{
        count: 42
      })
      |> Tory.Inventory.create_x_inventory()

    x_inventory
  end
end

defmodule Tory.MetaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tory.Meta` context.
  """

  @doc """
  Generate a parameter.
  """
  def parameter_fixture(attrs \\ %{}) do
    {:ok, parameter} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: "some value"
      })
      |> Tory.Meta.create_parameter()

    parameter
  end

  @doc """
  Generate a part_parameter.
  """
  def part_parameter_fixture(attrs \\ %{}) do
    {:ok, part_parameter} =
      attrs
      |> Enum.into(%{

      })
      |> Tory.Meta.create_part_parameter()

    part_parameter
  end

  @doc """
  Generate a icon.
  """
  def icon_fixture(attrs \\ %{}) do
    {:ok, icon} =
      attrs
      |> Enum.into(%{
        icon: "some icon"
      })
      |> Tory.Meta.create_icon()

    icon
  end
end

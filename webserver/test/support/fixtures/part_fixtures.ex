defmodule Tory.PartFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tory.Part` context.
  """

  @doc """
  Generate a x_part_x.
  """
  def x_part_x_fixture(attrs \\ %{}) do
    {:ok, x_part_x} =
      attrs
      |> Enum.into(%{
        mpn: "some mpn"
      })
      |> Tory.Part.create_x_part_x()

    x_part_x
  end
end

defmodule Tory.PartFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tory.Part` context.
  """

  @doc """
  Generate a part.
  """
  def part_fixture(attrs \\ %{}) do
    {:ok, part} =
      attrs
      |> Enum.into(%{
        mpn: "some mpn"
      })
      |> Tory.Part.create_part()

    Tory.Part.get_part_preloaded!(part.id)
  end
end

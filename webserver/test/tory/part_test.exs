defmodule Tory.PartTest do
  use Tory.DataCase

  alias Tory.Part

  describe "parts" do
    alias Tory.Part.Part, as: P

    import Tory.PartFixtures

    @invalid_attrs %{mpn: nil}

    test "listparts/0 returns all parts" do
      part = part_fixture()
      assert Part.listparts() == [part]
    end

    test "get_part!/1 returns the part with given id" do
      part = part_fixture()
      assert Part.get_part!(part.id) == part
    end

    test "create_part/1 with valid data creates a part" do
      valid_attrs = %{mpn: "some mpn"}

      assert {:ok, %P{} = part} = Part.create_part(valid_attrs)
      assert part.mpn == "some mpn"
    end

    test "create_part/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Part.create_part(@invalid_attrs)
    end

    test "update_part/2 with valid data updates the part" do
      part = part_fixture()
      update_attrs = %{mpn: "some updated mpn"}

      assert {:ok, %P{} = part} = Part.update_part(part, update_attrs)
      assert part.mpn == "some updated mpn"
    end

    test "update_part/2 with invalid data returns error changeset" do
      part = part_fixture()
      assert {:error, %Ecto.Changeset{}} = Part.update_part(part, @invalid_attrs)
      assert part == Part.get_part!(part.id)
    end

    test "delete_part/1 deletes the part" do
      part = part_fixture()
      assert {:ok, %P{}} = Part.delete_part(part)
      assert_raise Ecto.NoResultsError, fn -> Part.get_part!(part.id) end
    end

    test "change_part/1 returns a part changeset" do
      part = part_fixture()
      assert %Ecto.Changeset{} = Part.change_part(part)
    end
  end
end

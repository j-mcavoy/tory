defmodule Tory.PartTest do
  use Tory.DataCase

  alias Tory.Part

  describe "xpartsx" do
    alias Tory.Part.XPartX

    import Tory.PartFixtures

    @invalid_attrs %{mpn: nil}

    test "list_xpartsx/0 returns all xpartsx" do
      x_part_x = x_part_x_fixture()
      assert Part.list_xpartsx() == [x_part_x]
    end

    test "get_x_part_x!/1 returns the x_part_x with given id" do
      x_part_x = x_part_x_fixture()
      assert Part.get_x_part_x!(x_part_x.id) == x_part_x
    end

    test "create_x_part_x/1 with valid data creates a x_part_x" do
      valid_attrs = %{mpn: "some mpn"}

      assert {:ok, %XPartX{} = x_part_x} = Part.create_x_part_x(valid_attrs)
      assert x_part_x.mpn == "some mpn"
    end

    test "create_x_part_x/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Part.create_x_part_x(@invalid_attrs)
    end

    test "update_x_part_x/2 with valid data updates the x_part_x" do
      x_part_x = x_part_x_fixture()
      update_attrs = %{mpn: "some updated mpn"}

      assert {:ok, %XPartX{} = x_part_x} = Part.update_x_part_x(x_part_x, update_attrs)
      assert x_part_x.mpn == "some updated mpn"
    end

    test "update_x_part_x/2 with invalid data returns error changeset" do
      x_part_x = x_part_x_fixture()
      assert {:error, %Ecto.Changeset{}} = Part.update_x_part_x(x_part_x, @invalid_attrs)
      assert x_part_x == Part.get_x_part_x!(x_part_x.id)
    end

    test "delete_x_part_x/1 deletes the x_part_x" do
      x_part_x = x_part_x_fixture()
      assert {:ok, %XPartX{}} = Part.delete_x_part_x(x_part_x)
      assert_raise Ecto.NoResultsError, fn -> Part.get_x_part_x!(x_part_x.id) end
    end

    test "change_x_part_x/1 returns a x_part_x changeset" do
      x_part_x = x_part_x_fixture()
      assert %Ecto.Changeset{} = Part.change_x_part_x(x_part_x)
    end
  end
end

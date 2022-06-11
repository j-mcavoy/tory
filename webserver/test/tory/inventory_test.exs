defmodule Tory.InventoryTest do
  use Tory.DataCase

  alias Tory.Inventory

  describe "locations" do
    alias Tory.Inventory.Location

    import Tory.InventoryFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Inventory.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Inventory.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Location{} = location} = Inventory.create_location(valid_attrs)
      assert location.description == "some description"
      assert location.name == "some name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Location{} = location} = Inventory.update_location(location, update_attrs)
      assert location.description == "some updated description"
      assert location.name == "some updated name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_location(location, @invalid_attrs)
      assert location == Inventory.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Inventory.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Inventory.change_location(location)
    end
  end

  describe "parts" do
    alias Tory.Inventory.Part

    import Tory.InventoryFixtures

    @invalid_attrs %{barcode: nil, datasheet: nil, mpn: nil, octopart_uid: nil}

    test "list_parts/0 returns all parts" do
      part = part_fixture()
      assert Inventory.list_parts() == [part]
    end

    test "get_part!/1 returns the part with given id" do
      part = part_fixture()
      assert Inventory.get_part!(part.id) == part
    end

    test "create_part/1 with valid data creates a part" do
      valid_attrs = %{barcode: "some barcode", datasheet: "some datasheet", mpn: "some mpn", octopart_uid: "some octopart_uid"}

      assert {:ok, %Part{} = part} = Inventory.create_part(valid_attrs)
      assert part.barcode == "some barcode"
      assert part.datasheet == "some datasheet"
      assert part.mpn == "some mpn"
      assert part.octopart_uid == "some octopart_uid"
    end

    test "create_part/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_part(@invalid_attrs)
    end

    test "update_part/2 with valid data updates the part" do
      part = part_fixture()
      update_attrs = %{barcode: "some updated barcode", datasheet: "some updated datasheet", mpn: "some updated mpn", octopart_uid: "some updated octopart_uid"}

      assert {:ok, %Part{} = part} = Inventory.update_part(part, update_attrs)
      assert part.barcode == "some updated barcode"
      assert part.datasheet == "some updated datasheet"
      assert part.mpn == "some updated mpn"
      assert part.octopart_uid == "some updated octopart_uid"
    end

    test "update_part/2 with invalid data returns error changeset" do
      part = part_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_part(part, @invalid_attrs)
      assert part == Inventory.get_part!(part.id)
    end

    test "delete_part/1 deletes the part" do
      part = part_fixture()
      assert {:ok, %Part{}} = Inventory.delete_part(part)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_part!(part.id) end
    end

    test "change_part/1 returns a part changeset" do
      part = part_fixture()
      assert %Ecto.Changeset{} = Inventory.change_part(part)
    end
  end
end

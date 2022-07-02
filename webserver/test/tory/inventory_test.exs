defmodule Tory.InventoryTest do
  use Tory.DataCase

  alias Tory.Inventory

  describe "locations" do
    alias Tory.Inventory.Location

    import Tory.InventoryFixtures

    @invalid_attrs %{description: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Inventory.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Inventory.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %Location{} = location} = Inventory.create_location(valid_attrs)
      assert location.description == "some description"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Location{} = location} = Inventory.update_location(location, update_attrs)
      assert location.description == "some updated description"
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

  describe "xinventories" do
    alias Tory.Inventory.XInventory

    import Tory.InventoryFixtures

    @invalid_attrs %{count: nil}

    test "list_xinventories/0 returns all xinventories" do
      x_inventory = x_inventory_fixture()
      assert Inventory.list_xinventories() == [x_inventory]
    end

    test "get_x_inventory!/1 returns the x_inventory with given id" do
      x_inventory = x_inventory_fixture()
      assert Inventory.get_x_inventory!(x_inventory.id) == x_inventory
    end

    test "create_x_inventory/1 with valid data creates a x_inventory" do
      valid_attrs = %{count: 42}

      assert {:ok, %XInventory{} = x_inventory} = Inventory.create_x_inventory(valid_attrs)
      assert x_inventory.count == 42
    end

    test "create_x_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_x_inventory(@invalid_attrs)
    end

    test "update_x_inventory/2 with valid data updates the x_inventory" do
      x_inventory = x_inventory_fixture()
      update_attrs = %{count: 43}

      assert {:ok, %XInventory{} = x_inventory} = Inventory.update_x_inventory(x_inventory, update_attrs)
      assert x_inventory.count == 43
    end

    test "update_x_inventory/2 with invalid data returns error changeset" do
      x_inventory = x_inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_x_inventory(x_inventory, @invalid_attrs)
      assert x_inventory == Inventory.get_x_inventory!(x_inventory.id)
    end

    test "delete_x_inventory/1 deletes the x_inventory" do
      x_inventory = x_inventory_fixture()
      assert {:ok, %XInventory{}} = Inventory.delete_x_inventory(x_inventory)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_x_inventory!(x_inventory.id) end
    end

    test "change_x_inventory/1 returns a x_inventory changeset" do
      x_inventory = x_inventory_fixture()
      assert %Ecto.Changeset{} = Inventory.change_x_inventory(x_inventory)
    end
  end
end

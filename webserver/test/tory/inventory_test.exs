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

  describe "inventories" do
    alias Tory.Inventory.Inventory

    import Tory.InventoryFixtures

    @invalid_attrs %{count: nil}

    test "list_inventories/0 returns all inventories" do
      inventory = inventory_fixture()
      assert Inventory.list_inventories() == [inventory]
    end

    test "get_inventory!/1 returns the inventory with given id" do
      inventory = inventory_fixture()
      assert Inventory.get_inventory!(inventory.id) == inventory
    end

    test "create_inventory/1 with valid data creates a inventory" do
      valid_attrs = %{count: 42}

      assert {:ok, %inventory{} = inventory} = Inventory.create_inventory(valid_attrs)
      assert inventory.count == 42
    end

    test "create_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_inventory(@invalid_attrs)
    end

    test "update_inventory/2 with valid data updates the inventory" do
      inventory = inventory_fixture()
      update_attrs = %{count: 43}

      assert {:ok, %inventory{} = inventory} = Inventory.update_inventory(inventory, update_attrs)

      assert inventory.count == 43
    end

    test "update_inventory/2 with invalid data returns error changeset" do
      inventory = inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_inventory(inventory, @invalid_attrs)
      assert inventory == Inventory.get_inventory!(inventory.id)
    end

    test "delete_inventory/1 deletes the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %inventory{}} = Inventory.delete_inventory(inventory)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_inventory!(inventory.id) end
    end

    test "change_inventory/1 returns a inventory changeset" do
      inventory = inventory_fixture()
      assert %Ecto.Changeset{} = Inventory.change_inventory(inventory)
    end
  end
end

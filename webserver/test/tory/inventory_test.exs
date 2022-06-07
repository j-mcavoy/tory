defmodule Tory.InventoryTest do
  use Tory.DataCase

  alias Tory.Inventory

  describe "part" do
    alias Tory.Inventory.Part

    import Tory.InventoryFixtures

    @invalid_attrs %{
      barcode: nil,
      datasheet: nil,
      description: nil,
      mpn: nil,
      octopart_id: nil,
      price_usd: nil
    }

    test "list_part/0 returns all part" do
      part = part_fixture()
      assert Inventory.list_part() == [part]
    end

    test "get_part!/1 returns the part with given id" do
      part = part_fixture()
      assert Inventory.get_part!(part.id) == part
    end

    test "create_part/1 with valid data creates a part" do
      valid_attrs = %{
        barcode: "some barcode",
        datasheet: "some datasheet",
        description: "some description",
        mpn: "some mpn",
        octopart_id: "some octopart_id",
        price_usd: 42
      }

      assert {:ok, %Part{} = part} = Inventory.create_part(valid_attrs)
      assert part.barcode == "some barcode"
      assert part.datasheet == "some datasheet"
      assert part.description == "some description"
      assert part.mpn == "some mpn"
      assert part.octopart_id == "some octopart_id"
      assert part.price_usd == 42
    end

    test "create_part/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_part(@invalid_attrs)
    end

    test "update_part/2 with valid data updates the part" do
      part = part_fixture()

      update_attrs = %{
        barcode: "some updated barcode",
        datasheet: "some updated datasheet",
        description: "some updated description",
        mpn: "some updated mpn",
        octopart_id: "some updated octopart_id",
        price_usd: 43
      }

      assert {:ok, %Part{} = part} = Inventory.update_part(part, update_attrs)
      assert part.barcode == "some updated barcode"
      assert part.datasheet == "some updated datasheet"
      assert part.description == "some updated description"
      assert part.mpn == "some updated mpn"
      assert part.octopart_id == "some updated octopart_id"
      assert part.price_usd == 43
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

  describe "manufacturers" do
    alias Tory.Inventory.Manufacturer

    import Tory.InventoryFixtures

    @invalid_attrs %{name: nil, website: nil}

    test "list_manufacturers/0 returns all manufacturers" do
      manufacturer = manufacturer_fixture()
      assert Inventory.list_manufacturers() == [manufacturer]
    end

    test "get_manufacturer!/1 returns the manufacturer with given id" do
      manufacturer = manufacturer_fixture()
      assert Inventory.get_manufacturer!(manufacturer.id) == manufacturer
    end

    test "create_manufacturer/1 with valid data creates a manufacturer" do
      valid_attrs = %{name: "some name", website: "some website"}

      assert {:ok, %Manufacturer{} = manufacturer} = Inventory.create_manufacturer(valid_attrs)
      assert manufacturer.name == "some name"
      assert manufacturer.website == "some website"
    end

    test "create_manufacturer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_manufacturer(@invalid_attrs)
    end

    test "update_manufacturer/2 with valid data updates the manufacturer" do
      manufacturer = manufacturer_fixture()
      update_attrs = %{name: "some updated name", website: "some updated website"}

      assert {:ok, %Manufacturer{} = manufacturer} =
               Inventory.update_manufacturer(manufacturer, update_attrs)

      assert manufacturer.name == "some updated name"
      assert manufacturer.website == "some updated website"
    end

    test "update_manufacturer/2 with invalid data returns error changeset" do
      manufacturer = manufacturer_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Inventory.update_manufacturer(manufacturer, @invalid_attrs)

      assert manufacturer == Inventory.get_manufacturer!(manufacturer.id)
    end

    test "delete_manufacturer/1 deletes the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, %Manufacturer{}} = Inventory.delete_manufacturer(manufacturer)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_manufacturer!(manufacturer.id) end
    end

    test "change_manufacturer/1 returns a manufacturer changeset" do
      manufacturer = manufacturer_fixture()
      assert %Ecto.Changeset{} = Inventory.change_manufacturer(manufacturer)
    end
  end

  describe "distributors" do
    alias Tory.Inventory.Distributor

    import Tory.InventoryFixtures

    @invalid_attrs %{name: nil, website: nil}

    test "list_distributors/0 returns all distributors" do
      distributor = distributor_fixture()
      assert Inventory.list_distributors() == [distributor]
    end

    test "get_distributor!/1 returns the distributor with given id" do
      distributor = distributor_fixture()
      assert Inventory.get_distributor!(distributor.id) == distributor
    end

    test "create_distributor/1 with valid data creates a distributor" do
      valid_attrs = %{name: "some name", website: "some website"}

      assert {:ok, %Distributor{} = distributor} = Inventory.create_distributor(valid_attrs)
      assert distributor.name == "some name"
      assert distributor.website == "some website"
    end

    test "create_distributor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_distributor(@invalid_attrs)
    end

    test "update_distributor/2 with valid data updates the distributor" do
      distributor = distributor_fixture()
      update_attrs = %{name: "some updated name", website: "some updated website"}

      assert {:ok, %Distributor{} = distributor} =
               Inventory.update_distributor(distributor, update_attrs)

      assert distributor.name == "some updated name"
      assert distributor.website == "some updated website"
    end

    test "update_distributor/2 with invalid data returns error changeset" do
      distributor = distributor_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Inventory.update_distributor(distributor, @invalid_attrs)

      assert distributor == Inventory.get_distributor!(distributor.id)
    end

    test "delete_distributor/1 deletes the distributor" do
      distributor = distributor_fixture()
      assert {:ok, %Distributor{}} = Inventory.delete_distributor(distributor)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_distributor!(distributor.id) end
    end

    test "change_distributor/1 returns a distributor changeset" do
      distributor = distributor_fixture()
      assert %Ecto.Changeset{} = Inventory.change_distributor(distributor)
    end
  end

  describe "attributes" do
    alias Tory.Inventory.Attribute

    import Tory.InventoryFixtures

    @invalid_attrs %{name: nil, unit: nil, value: nil}

    test "list_attributes/0 returns all attributes" do
      attribute = attribute_fixture()
      assert Inventory.list_attributes() == [attribute]
    end

    test "get_attribute!/1 returns the attribute with given id" do
      attribute = attribute_fixture()
      assert Inventory.get_attribute!(attribute.id) == attribute
    end

    test "create_attribute/1 with valid data creates a attribute" do
      valid_attrs = %{name: "some name", unit: "some unit", value: "some value"}

      assert {:ok, %Attribute{} = attribute} = Inventory.create_attribute(valid_attrs)
      assert attribute.name == "some name"
      assert attribute.unit == "some unit"
      assert attribute.value == "some value"
    end

    test "create_attribute/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_attribute(@invalid_attrs)
    end

    test "update_attribute/2 with valid data updates the attribute" do
      attribute = attribute_fixture()

      update_attrs = %{
        name: "some updated name",
        unit: "some updated unit",
        value: "some updated value"
      }

      assert {:ok, %Attribute{} = attribute} = Inventory.update_attribute(attribute, update_attrs)
      assert attribute.name == "some updated name"
      assert attribute.unit == "some updated unit"
      assert attribute.value == "some updated value"
    end

    test "update_attribute/2 with invalid data returns error changeset" do
      attribute = attribute_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_attribute(attribute, @invalid_attrs)
      assert attribute == Inventory.get_attribute!(attribute.id)
    end

    test "delete_attribute/1 deletes the attribute" do
      attribute = attribute_fixture()
      assert {:ok, %Attribute{}} = Inventory.delete_attribute(attribute)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_attribute!(attribute.id) end
    end

    test "change_attribute/1 returns a attribute changeset" do
      attribute = attribute_fixture()
      assert %Ecto.Changeset{} = Inventory.change_attribute(attribute)
    end
  end
end

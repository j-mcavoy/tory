defmodule Tory.MetaTest do
  use Tory.DataCase

  alias Tory.Meta

  describe "parameters" do
    alias Tory.Meta.Parameter

    import Tory.MetaFixtures

    @invalid_attrs %{name: nil, value: nil}

    test "list_parameters/0 returns all parameters" do
      parameter = parameter_fixture()
      assert Meta.list_parameters() == [parameter]
    end

    test "get_parameter!/1 returns the parameter with given id" do
      parameter = parameter_fixture()
      assert Meta.get_parameter!(parameter.id) == parameter
    end

    test "create_parameter/1 with valid data creates a parameter" do
      valid_attrs = %{name: "some name", value: "some value"}

      assert {:ok, %Parameter{} = parameter} = Meta.create_parameter(valid_attrs)
      assert parameter.name == "some name"
      assert parameter.value == "some value"
    end

    test "create_parameter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meta.create_parameter(@invalid_attrs)
    end

    test "update_parameter/2 with valid data updates the parameter" do
      parameter = parameter_fixture()
      update_attrs = %{name: "some updated name", value: "some updated value"}

      assert {:ok, %Parameter{} = parameter} = Meta.update_parameter(parameter, update_attrs)
      assert parameter.name == "some updated name"
      assert parameter.value == "some updated value"
    end

    test "update_parameter/2 with invalid data returns error changeset" do
      parameter = parameter_fixture()
      assert {:error, %Ecto.Changeset{}} = Meta.update_parameter(parameter, @invalid_attrs)
      assert parameter == Meta.get_parameter!(parameter.id)
    end

    test "delete_parameter/1 deletes the parameter" do
      parameter = parameter_fixture()
      assert {:ok, %Parameter{}} = Meta.delete_parameter(parameter)
      assert_raise Ecto.NoResultsError, fn -> Meta.get_parameter!(parameter.id) end
    end

    test "change_parameter/1 returns a parameter changeset" do
      parameter = parameter_fixture()
      assert %Ecto.Changeset{} = Meta.change_parameter(parameter)
    end
  end

  describe "partparameters" do
    alias Tory.Meta.PartParameter

    import Tory.MetaFixtures

    @invalid_attrs %{}

    test "list_partparameters/0 returns all partparameters" do
      part_parameter = part_parameter_fixture()
      assert Meta.list_partparameters() == [part_parameter]
    end

    test "get_part_parameter!/1 returns the part_parameter with given id" do
      part_parameter = part_parameter_fixture()
      assert Meta.get_part_parameter!(part_parameter.id) == part_parameter
    end

    test "create_part_parameter/1 with valid data creates a part_parameter" do
      valid_attrs = %{}

      assert {:ok, %PartParameter{} = part_parameter} = Meta.create_part_parameter(valid_attrs)
    end

    test "create_part_parameter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meta.create_part_parameter(@invalid_attrs)
    end

    test "update_part_parameter/2 with valid data updates the part_parameter" do
      part_parameter = part_parameter_fixture()
      update_attrs = %{}

      assert {:ok, %PartParameter{} = part_parameter} = Meta.update_part_parameter(part_parameter, update_attrs)
    end

    test "update_part_parameter/2 with invalid data returns error changeset" do
      part_parameter = part_parameter_fixture()
      assert {:error, %Ecto.Changeset{}} = Meta.update_part_parameter(part_parameter, @invalid_attrs)
      assert part_parameter == Meta.get_part_parameter!(part_parameter.id)
    end

    test "delete_part_parameter/1 deletes the part_parameter" do
      part_parameter = part_parameter_fixture()
      assert {:ok, %PartParameter{}} = Meta.delete_part_parameter(part_parameter)
      assert_raise Ecto.NoResultsError, fn -> Meta.get_part_parameter!(part_parameter.id) end
    end

    test "change_part_parameter/1 returns a part_parameter changeset" do
      part_parameter = part_parameter_fixture()
      assert %Ecto.Changeset{} = Meta.change_part_parameter(part_parameter)
    end
  end
end

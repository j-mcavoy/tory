defmodule ToryWeb.PartLocationControllerTest do
  use ToryWeb.ConnCase

  import Tory.InventoryFixtures

  @create_attrs %{count: 42}
  @update_attrs %{count: 43}
  @invalid_attrs %{count: nil}

  describe "index" do
    test "lists all partlocations", %{conn: conn} do
      conn = get(conn, Routes.part_location_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Partlocations"
    end
  end

  describe "new part_location" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.part_location_path(conn, :new))
      assert html_response(conn, 200) =~ "New Part location"
    end
  end

  describe "create part_location" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.part_location_path(conn, :create), part_location: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.part_location_path(conn, :show, id)

      conn = get(conn, Routes.part_location_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Part location"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.part_location_path(conn, :create), part_location: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Part location"
    end
  end

  describe "edit part_location" do
    setup [:create_part_location]

    test "renders form for editing chosen part_location", %{conn: conn, part_location: part_location} do
      conn = get(conn, Routes.part_location_path(conn, :edit, part_location))
      assert html_response(conn, 200) =~ "Edit Part location"
    end
  end

  describe "update part_location" do
    setup [:create_part_location]

    test "redirects when data is valid", %{conn: conn, part_location: part_location} do
      conn = put(conn, Routes.part_location_path(conn, :update, part_location), part_location: @update_attrs)
      assert redirected_to(conn) == Routes.part_location_path(conn, :show, part_location)

      conn = get(conn, Routes.part_location_path(conn, :show, part_location))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, part_location: part_location} do
      conn = put(conn, Routes.part_location_path(conn, :update, part_location), part_location: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Part location"
    end
  end

  describe "delete part_location" do
    setup [:create_part_location]

    test "deletes chosen part_location", %{conn: conn, part_location: part_location} do
      conn = delete(conn, Routes.part_location_path(conn, :delete, part_location))
      assert redirected_to(conn) == Routes.part_location_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.part_location_path(conn, :show, part_location))
      end
    end
  end

  defp create_part_location(_) do
    part_location = part_location_fixture()
    %{part_location: part_location}
  end
end

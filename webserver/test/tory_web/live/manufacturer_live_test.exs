defmodule ToryWeb.ManufacturerLiveTest do
  use ToryWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tory.InventoryFixtures

  @create_attrs %{name: "some name", website: "some website"}
  @update_attrs %{name: "some updated name", website: "some updated website"}
  @invalid_attrs %{name: nil, website: nil}

  defp create_manufacturer(_) do
    manufacturer = manufacturer_fixture()
    %{manufacturer: manufacturer}
  end

  describe "Index" do
    setup [:create_manufacturer]

    test "lists all manufacturers", %{conn: conn, manufacturer: manufacturer} do
      {:ok, _index_live, html} = live(conn, Routes.manufacturer_index_path(conn, :index))

      assert html =~ "Listing Manufacturers"
      assert html =~ manufacturer.name
    end

    test "saves new manufacturer", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.manufacturer_index_path(conn, :index))

      assert index_live |> element("a", "New Manufacturer") |> render_click() =~
               "New Manufacturer"

      assert_patch(index_live, Routes.manufacturer_index_path(conn, :new))

      assert index_live
             |> form("#manufacturer-form", manufacturer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#manufacturer-form", manufacturer: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.manufacturer_index_path(conn, :index))

      assert html =~ "Manufacturer created successfully"
      assert html =~ "some name"
    end

    test "updates manufacturer in listing", %{conn: conn, manufacturer: manufacturer} do
      {:ok, index_live, _html} = live(conn, Routes.manufacturer_index_path(conn, :index))

      assert index_live |> element("#manufacturer-#{manufacturer.id} a", "Edit") |> render_click() =~
               "Edit Manufacturer"

      assert_patch(index_live, Routes.manufacturer_index_path(conn, :edit, manufacturer))

      assert index_live
             |> form("#manufacturer-form", manufacturer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#manufacturer-form", manufacturer: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.manufacturer_index_path(conn, :index))

      assert html =~ "Manufacturer updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes manufacturer in listing", %{conn: conn, manufacturer: manufacturer} do
      {:ok, index_live, _html} = live(conn, Routes.manufacturer_index_path(conn, :index))

      assert index_live
             |> element("#manufacturer-#{manufacturer.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#manufacturer-#{manufacturer.id}")
    end
  end

  describe "Show" do
    setup [:create_manufacturer]

    test "displays manufacturer", %{conn: conn, manufacturer: manufacturer} do
      {:ok, _show_live, html} =
        live(conn, Routes.manufacturer_show_path(conn, :show, manufacturer))

      assert html =~ "Show Manufacturer"
      assert html =~ manufacturer.name
    end

    test "updates manufacturer within modal", %{conn: conn, manufacturer: manufacturer} do
      {:ok, show_live, _html} =
        live(conn, Routes.manufacturer_show_path(conn, :show, manufacturer))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Manufacturer"

      assert_patch(show_live, Routes.manufacturer_show_path(conn, :edit, manufacturer))

      assert show_live
             |> form("#manufacturer-form", manufacturer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#manufacturer-form", manufacturer: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.manufacturer_show_path(conn, :show, manufacturer))

      assert html =~ "Manufacturer updated successfully"
      assert html =~ "some updated name"
    end
  end
end

defmodule ToryWeb.InventoryLiveTest do
  use ToryWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tory.InventoryFixtures

  @create_attrs %{count: 42}
  @update_attrs %{count: 43}
  @invalid_attrs %{count: nil}

  defp create_inventory(_) do
    inventory = inventory_fixture()
    %{inventory: inventory}
  end

  describe "Index" do
    setup [:create_inventory]

    test "lists all inventories", %{conn: conn} do
      {:ok, _indelive, html} = live(conn, Routes.inventory_indepath(conn, :index))

      assert html =~ "Listing inventories"
    end

    test "saves new inventory", %{conn: conn} do
      {:ok, indelive, _html} = live(conn, Routes.inventory_indepath(conn, :index))

      assert indelive |> element("a", "New inventory") |> render_click() =~
               "New inventory"

      assert_patch(indelive, Routes.inventory_indepath(conn, :new))

      assert indelive
             |> form("#inventory-form", inventory: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        indelive
        |> form("#inventory-form", inventory: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.inventory_indepath(conn, :index))

      assert html =~ "inventory created successfully"
    end

    test "updates inventory in listing", %{conn: conn, inventory: inventory} do
      {:ok, indelive, _html} = live(conn, Routes.inventory_indepath(conn, :index))

      assert indelive |> element("#inventory-#{inventory.id} a", "Edit") |> render_click() =~
               "Edit inventory"

      assert_patch(indelive, Routes.inventory_indepath(conn, :edit, inventory))

      assert indelive
             |> form("#inventory-form", inventory: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        indelive
        |> form("#inventory-form", inventory: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.inventory_indepath(conn, :index))

      assert html =~ "inventory updated successfully"
    end

    test "deletes inventory in listing", %{conn: conn, inventory: inventory} do
      {:ok, indelive, _html} = live(conn, Routes.inventory_indepath(conn, :index))

      assert indelive |> element("#inventory-#{inventory.id} a", "Delete") |> render_click()
      refute has_element?(indelive, "#inventory-#{inventory.id}")
    end
  end

  describe "Show" do
    setup [:create_inventory]

    test "displays inventory", %{conn: conn, inventory: inventory} do
      {:ok, _show_live, html} = live(conn, Routes.inventory_show_path(conn, :show, inventory))

      assert html =~ "Show inventory"
    end

    test "updates inventory within modal", %{conn: conn, inventory: inventory} do
      {:ok, show_live, _html} = live(conn, Routes.inventory_show_path(conn, :show, inventory))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit inventory"

      assert_patch(show_live, Routes.inventory_show_path(conn, :edit, inventory))

      assert show_live
             |> form("#inventory-form", inventory: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#inventory-form", inventory: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.inventory_show_path(conn, :show, inventory))

      assert html =~ "inventory updated successfully"
    end
  end
end

defmodule ToryWeb.XInventoryLiveTest do
  use ToryWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tory.InventoryFixtures

  @create_attrs %{count: 42}
  @update_attrs %{count: 43}
  @invalid_attrs %{count: nil}

  defp create_x_inventory(_) do
    x_inventory = x_inventory_fixture()
    %{x_inventory: x_inventory}
  end

  describe "Index" do
    setup [:create_x_inventory]

    test "lists all xinventories", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.x_inventory_index_path(conn, :index))

      assert html =~ "Listing Xinventories"
    end

    test "saves new x_inventory", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.x_inventory_index_path(conn, :index))

      assert index_live |> element("a", "New inventory") |> render_click() =~
               "New inventory"

      assert_patch(index_live, Routes.x_inventory_index_path(conn, :new))

      assert index_live
             |> form("#x_inventory-form", x_inventory: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#x_inventory-form", x_inventory: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.x_inventory_index_path(conn, :index))

      assert html =~ "inventory created successfully"
    end

    test "updates x_inventory in listing", %{conn: conn, x_inventory: x_inventory} do
      {:ok, index_live, _html} = live(conn, Routes.x_inventory_index_path(conn, :index))

      assert index_live |> element("#x_inventory-#{x_inventory.id} a", "Edit") |> render_click() =~
               "Edit inventory"

      assert_patch(index_live, Routes.x_inventory_index_path(conn, :edit, x_inventory))

      assert index_live
             |> form("#x_inventory-form", x_inventory: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#x_inventory-form", x_inventory: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.x_inventory_index_path(conn, :index))

      assert html =~ "inventory updated successfully"
    end

    test "deletes x_inventory in listing", %{conn: conn, x_inventory: x_inventory} do
      {:ok, index_live, _html} = live(conn, Routes.x_inventory_index_path(conn, :index))

      assert index_live |> element("#x_inventory-#{x_inventory.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#x_inventory-#{x_inventory.id}")
    end
  end

  describe "Show" do
    setup [:create_x_inventory]

    test "displays x_inventory", %{conn: conn, x_inventory: x_inventory} do
      {:ok, _show_live, html} = live(conn, Routes.x_inventory_show_path(conn, :show, x_inventory))

      assert html =~ "Show inventory"
    end

    test "updates x_inventory within modal", %{conn: conn, x_inventory: x_inventory} do
      {:ok, show_live, _html} = live(conn, Routes.x_inventory_show_path(conn, :show, x_inventory))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit inventory"

      assert_patch(show_live, Routes.x_inventory_show_path(conn, :edit, x_inventory))

      assert show_live
             |> form("#x_inventory-form", x_inventory: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#x_inventory-form", x_inventory: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.x_inventory_show_path(conn, :show, x_inventory))

      assert html =~ "inventory updated successfully"
    end
  end
end

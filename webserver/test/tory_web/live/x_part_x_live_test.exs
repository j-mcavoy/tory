defmodule ToryWeb.XPartXLiveTest do
  use ToryWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tory.PartFixtures

  @create_attrs %{mpn: "some mpn"}
  @update_attrs %{mpn: "some updated mpn"}
  @invalid_attrs %{mpn: nil}

  defp create_x_part_x(_) do
    x_part_x = x_part_x_fixture()
    %{x_part_x: x_part_x}
  end

  describe "Index" do
    setup [:create_x_part_x]

    test "lists all xpartsx", %{conn: conn, x_part_x: x_part_x} do
      {:ok, _index_live, html} = live(conn, Routes.x_part_x_index_path(conn, :index))

      assert html =~ "Listing Xpartsx"
      assert html =~ x_part_x.mpn
    end

    test "saves new x_part_x", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.x_part_x_index_path(conn, :index))

      assert index_live |> element("a", "New X part x") |> render_click() =~
               "New X part x"

      assert_patch(index_live, Routes.x_part_x_index_path(conn, :new))

      assert index_live
             |> form("#x_part_x-form", x_part_x: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#x_part_x-form", x_part_x: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.x_part_x_index_path(conn, :index))

      assert html =~ "X part x created successfully"
      assert html =~ "some mpn"
    end

    test "updates x_part_x in listing", %{conn: conn, x_part_x: x_part_x} do
      {:ok, index_live, _html} = live(conn, Routes.x_part_x_index_path(conn, :index))

      assert index_live |> element("#x_part_x-#{x_part_x.id} a", "Edit") |> render_click() =~
               "Edit X part x"

      assert_patch(index_live, Routes.x_part_x_index_path(conn, :edit, x_part_x))

      assert index_live
             |> form("#x_part_x-form", x_part_x: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#x_part_x-form", x_part_x: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.x_part_x_index_path(conn, :index))

      assert html =~ "X part x updated successfully"
      assert html =~ "some updated mpn"
    end

    test "deletes x_part_x in listing", %{conn: conn, x_part_x: x_part_x} do
      {:ok, index_live, _html} = live(conn, Routes.x_part_x_index_path(conn, :index))

      assert index_live |> element("#x_part_x-#{x_part_x.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#x_part_x-#{x_part_x.id}")
    end
  end

  describe "Show" do
    setup [:create_x_part_x]

    test "displays x_part_x", %{conn: conn, x_part_x: x_part_x} do
      {:ok, _show_live, html} = live(conn, Routes.x_part_x_show_path(conn, :show, x_part_x))

      assert html =~ "Show X part x"
      assert html =~ x_part_x.mpn
    end

    test "updates x_part_x within modal", %{conn: conn, x_part_x: x_part_x} do
      {:ok, show_live, _html} = live(conn, Routes.x_part_x_show_path(conn, :show, x_part_x))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit X part x"

      assert_patch(show_live, Routes.x_part_x_show_path(conn, :edit, x_part_x))

      assert show_live
             |> form("#x_part_x-form", x_part_x: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#x_part_x-form", x_part_x: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.x_part_x_show_path(conn, :show, x_part_x))

      assert html =~ "X part x updated successfully"
      assert html =~ "some updated mpn"
    end
  end
end

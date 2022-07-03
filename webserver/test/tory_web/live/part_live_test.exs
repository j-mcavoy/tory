defmodule ToryWeb.XPartXLiveTest do
  use ToryWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tory.PartFixtures

  @create_attrs %{mpn: "some mpn"}
  @update_attrs %{mpn: "some updated mpn"}
  @invalid_attrs %{mpn: nil}

  defp create_part(_) do
    part = part_fixture()
    %{part: part}
  end

  describe "Index" do
    setup [:create_part]

    test "lists all parts", %{conn: conn, part: part} do
      {:ok, _indelive, html} = live(conn, Routes.part_indepath(conn, :index))

      assert html =~ "Listing parts"
      assert html =~ part.mpn
    end

    test "saves new part", %{conn: conn} do
      {:ok, indelive, _html} = live(conn, Routes.part_indepath(conn, :index))

      assert indelive |> element("a", "New part") |> render_click() =~
               "New part"

      assert_patch(indelive, Routes.part_indepath(conn, :new))

      assert indelive
             |> form("#part-form", part: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        indelive
        |> form("#part-form", part: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.part_indepath(conn, :index))

      assert html =~ "part created successfully"
      assert html =~ "some mpn"
    end

    test "updates part in listing", %{conn: conn, part: part} do
      {:ok, indelive, _html} = live(conn, Routes.part_indepath(conn, :index))

      assert indelive |> element("#part-#{part.id} a", "Edit") |> render_click() =~
               "Edit part"

      assert_patch(indelive, Routes.part_indepath(conn, :edit, part))

      assert indelive
             |> form("#part-form", part: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        indelive
        |> form("#part-form", part: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.part_indepath(conn, :index))

      assert html =~ "part updated successfully"
      assert html =~ "some updated mpn"
    end

    test "deletes part in listing", %{conn: conn, part: part} do
      {:ok, indelive, _html} = live(conn, Routes.part_indepath(conn, :index))

      assert indelive |> element("#part-#{part.id} a", "Delete") |> render_click()
      refute has_element?(indelive, "#part-#{part.id}")
    end
  end

  describe "Show" do
    setup [:create_part]

    test "displays part", %{conn: conn, part: part} do
      {:ok, _show_live, html} = live(conn, Routes.part_show_path(conn, :show, part))

      assert html =~ "Show part"
      assert html =~ part.mpn
    end

    test "updates part within modal", %{conn: conn, part: part} do
      {:ok, show_live, _html} = live(conn, Routes.part_show_path(conn, :show, part))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit part"

      assert_patch(show_live, Routes.part_show_path(conn, :edit, part))

      assert show_live
             |> form("#part-form", part: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#part-form", part: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.part_show_path(conn, :show, part))

      assert html =~ "part updated successfully"
      assert html =~ "some updated mpn"
    end
  end
end

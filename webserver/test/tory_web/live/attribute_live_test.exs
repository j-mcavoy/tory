defmodule ToryWeb.AttributeLiveTest do
  use ToryWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tory.InventoryFixtures

  @create_attrs %{name: "some name", unit: "some unit", value: "some value"}
  @update_attrs %{
    name: "some updated name",
    unit: "some updated unit",
    value: "some updated value"
  }
  @invalid_attrs %{name: nil, unit: nil, value: nil}

  defp create_attribute(_) do
    attribute = attribute_fixture()
    %{attribute: attribute}
  end

  describe "Index" do
    setup [:create_attribute]

    test "lists all attributes", %{conn: conn, attribute: attribute} do
      {:ok, _index_live, html} = live(conn, Routes.attribute_index_path(conn, :index))

      assert html =~ "Listing Attributes"
      assert html =~ attribute.name
    end

    test "saves new attribute", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.attribute_index_path(conn, :index))

      assert index_live |> element("a", "New Attribute") |> render_click() =~
               "New Attribute"

      assert_patch(index_live, Routes.attribute_index_path(conn, :new))

      assert index_live
             |> form("#attribute-form", attribute: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#attribute-form", attribute: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.attribute_index_path(conn, :index))

      assert html =~ "Attribute created successfully"
      assert html =~ "some name"
    end

    test "updates attribute in listing", %{conn: conn, attribute: attribute} do
      {:ok, index_live, _html} = live(conn, Routes.attribute_index_path(conn, :index))

      assert index_live |> element("#attribute-#{attribute.id} a", "Edit") |> render_click() =~
               "Edit Attribute"

      assert_patch(index_live, Routes.attribute_index_path(conn, :edit, attribute))

      assert index_live
             |> form("#attribute-form", attribute: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#attribute-form", attribute: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.attribute_index_path(conn, :index))

      assert html =~ "Attribute updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes attribute in listing", %{conn: conn, attribute: attribute} do
      {:ok, index_live, _html} = live(conn, Routes.attribute_index_path(conn, :index))

      assert index_live |> element("#attribute-#{attribute.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#attribute-#{attribute.id}")
    end
  end

  describe "Show" do
    setup [:create_attribute]

    test "displays attribute", %{conn: conn, attribute: attribute} do
      {:ok, _show_live, html} = live(conn, Routes.attribute_show_path(conn, :show, attribute))

      assert html =~ "Show Attribute"
      assert html =~ attribute.name
    end

    test "updates attribute within modal", %{conn: conn, attribute: attribute} do
      {:ok, show_live, _html} = live(conn, Routes.attribute_show_path(conn, :show, attribute))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Attribute"

      assert_patch(show_live, Routes.attribute_show_path(conn, :edit, attribute))

      assert show_live
             |> form("#attribute-form", attribute: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#attribute-form", attribute: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.attribute_show_path(conn, :show, attribute))

      assert html =~ "Attribute updated successfully"
      assert html =~ "some updated name"
    end
  end
end

defmodule ToryWeb.PartControllerTest do
  use ToryWeb.ConnCase

  import Tory.InventoryFixtures

  @create_attrs %{barcode: "some barcode", datasheet: "some datasheet", mpn: "some mpn", octopart_uid: "some octopart_uid"}
  @update_attrs %{barcode: "some updated barcode", datasheet: "some updated datasheet", mpn: "some updated mpn", octopart_uid: "some updated octopart_uid"}
  @invalid_attrs %{barcode: nil, datasheet: nil, mpn: nil, octopart_uid: nil}

  describe "index" do
    test "lists all parts", %{conn: conn} do
      conn = get(conn, Routes.part_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Parts"
    end
  end

  describe "new part" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.part_path(conn, :new))
      assert html_response(conn, 200) =~ "New Part"
    end
  end

  describe "create part" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.part_path(conn, :create), part: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.part_path(conn, :show, id)

      conn = get(conn, Routes.part_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Part"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.part_path(conn, :create), part: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Part"
    end
  end

  describe "edit part" do
    setup [:create_part]

    test "renders form for editing chosen part", %{conn: conn, part: part} do
      conn = get(conn, Routes.part_path(conn, :edit, part))
      assert html_response(conn, 200) =~ "Edit Part"
    end
  end

  describe "update part" do
    setup [:create_part]

    test "redirects when data is valid", %{conn: conn, part: part} do
      conn = put(conn, Routes.part_path(conn, :update, part), part: @update_attrs)
      assert redirected_to(conn) == Routes.part_path(conn, :show, part)

      conn = get(conn, Routes.part_path(conn, :show, part))
      assert html_response(conn, 200) =~ "some updated barcode"
    end

    test "renders errors when data is invalid", %{conn: conn, part: part} do
      conn = put(conn, Routes.part_path(conn, :update, part), part: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Part"
    end
  end

  describe "delete part" do
    setup [:create_part]

    test "deletes chosen part", %{conn: conn, part: part} do
      conn = delete(conn, Routes.part_path(conn, :delete, part))
      assert redirected_to(conn) == Routes.part_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.part_path(conn, :show, part))
      end
    end
  end

  defp create_part(_) do
    part = part_fixture()
    %{part: part}
  end
end

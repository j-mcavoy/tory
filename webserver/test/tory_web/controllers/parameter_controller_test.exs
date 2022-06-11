defmodule ToryWeb.ParameterControllerTest do
  use ToryWeb.ConnCase

  import Tory.MetaFixtures

  @create_attrs %{name: "some name", value: "some value"}
  @update_attrs %{name: "some updated name", value: "some updated value"}
  @invalid_attrs %{name: nil, value: nil}

  describe "index" do
    test "lists all parameters", %{conn: conn} do
      conn = get(conn, Routes.parameter_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Parameters"
    end
  end

  describe "new parameter" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.parameter_path(conn, :new))
      assert html_response(conn, 200) =~ "New Parameter"
    end
  end

  describe "create parameter" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.parameter_path(conn, :create), parameter: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.parameter_path(conn, :show, id)

      conn = get(conn, Routes.parameter_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Parameter"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.parameter_path(conn, :create), parameter: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Parameter"
    end
  end

  describe "edit parameter" do
    setup [:create_parameter]

    test "renders form for editing chosen parameter", %{conn: conn, parameter: parameter} do
      conn = get(conn, Routes.parameter_path(conn, :edit, parameter))
      assert html_response(conn, 200) =~ "Edit Parameter"
    end
  end

  describe "update parameter" do
    setup [:create_parameter]

    test "redirects when data is valid", %{conn: conn, parameter: parameter} do
      conn = put(conn, Routes.parameter_path(conn, :update, parameter), parameter: @update_attrs)
      assert redirected_to(conn) == Routes.parameter_path(conn, :show, parameter)

      conn = get(conn, Routes.parameter_path(conn, :show, parameter))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, parameter: parameter} do
      conn = put(conn, Routes.parameter_path(conn, :update, parameter), parameter: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Parameter"
    end
  end

  describe "delete parameter" do
    setup [:create_parameter]

    test "deletes chosen parameter", %{conn: conn, parameter: parameter} do
      conn = delete(conn, Routes.parameter_path(conn, :delete, parameter))
      assert redirected_to(conn) == Routes.parameter_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.parameter_path(conn, :show, parameter))
      end
    end
  end

  defp create_parameter(_) do
    parameter = parameter_fixture()
    %{parameter: parameter}
  end
end

defmodule ToryWeb.ParameterController do
  use ToryWeb, :controller

  alias Tory.Meta
  alias Tory.Meta.Parameter

  def index(conn, _params) do
    parameters = Meta.list_parameters()
    render(conn, "index.html", parameters: parameters)
  end

  def new(conn, _params) do
    changeset = Meta.change_parameter(%Parameter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"parameter" => parameter_params}) do
    case Meta.create_parameter(parameter_params) do
      {:ok, parameter} ->
        conn
        |> put_flash(:info, "Parameter created successfully.")
        |> redirect(to: Routes.parameter_path(conn, :show, parameter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parameter = Meta.get_parameter!(id)
    render(conn, "show.html", parameter: parameter)
  end

  def edit(conn, %{"id" => id}) do
    parameter = Meta.get_parameter!(id)
    changeset = Meta.change_parameter(parameter)
    render(conn, "edit.html", parameter: parameter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "parameter" => parameter_params}) do
    parameter = Meta.get_parameter!(id)

    case Meta.update_parameter(parameter, parameter_params) do
      {:ok, parameter} ->
        conn
        |> put_flash(:info, "Parameter updated successfully.")
        |> redirect(to: Routes.parameter_path(conn, :show, parameter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", parameter: parameter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parameter = Meta.get_parameter!(id)
    {:ok, _parameter} = Meta.delete_parameter(parameter)

    conn
    |> put_flash(:info, "Parameter deleted successfully.")
    |> redirect(to: Routes.parameter_path(conn, :index))
  end
end

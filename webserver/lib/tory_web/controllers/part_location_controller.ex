defmodule ToryWeb.PartLocationController do
  use ToryWeb, :controller

  alias Tory.Inventory
  alias Tory.Inventory.PartLocation

  def index(conn, _params) do
    partlocations = Inventory.list_partlocations()
    render(conn, "index.html", partlocations: partlocations)
  end

  def new(conn, _params) do
    changeset = Inventory.change_part_location(%PartLocation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"part_location" => part_location_params}) do
    case Inventory.create_part_location(part_location_params) do
      {:ok, part_location} ->
        conn
        |> put_flash(:info, "Part location created successfully.")
        |> redirect(to: Routes.part_location_path(conn, :show, part_location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    part_location = Inventory.get_part_location!(id)
    render(conn, "show.html", part_location: part_location)
  end

  def edit(conn, %{"id" => id}) do
    part_location = Inventory.get_part_location!(id)
    changeset = Inventory.change_part_location(part_location)
    render(conn, "edit.html", part_location: part_location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "part_location" => part_location_params}) do
    part_location = Inventory.get_part_location!(id)

    case Inventory.update_part_location(part_location, part_location_params) do
      {:ok, part_location} ->
        conn
        |> put_flash(:info, "Part location updated successfully.")
        |> redirect(to: Routes.part_location_path(conn, :show, part_location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", part_location: part_location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    part_location = Inventory.get_part_location!(id)
    {:ok, _part_location} = Inventory.delete_part_location(part_location)

    conn
    |> put_flash(:info, "Part location deleted successfully.")
    |> redirect(to: Routes.part_location_path(conn, :index))
  end
end

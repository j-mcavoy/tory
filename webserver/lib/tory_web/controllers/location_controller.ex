defmodule ToryWeb.LocationController do
  use ToryWeb, :controller

  alias Tory.Inventory
  alias Tory.Inventory.Location

  def index(conn, _params) do
    locations = Inventory.list_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = Inventory.change_location(%Location{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location" => location_params}) do
    case Inventory.create_location(location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: Routes.location_path(conn, :show, location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Inventory.get_location!(id)
    render(conn, "show.html", location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Inventory.get_location!(id)
    changeset = Inventory.change_location(location)
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Inventory.get_location!(id)

    case Inventory.update_location(location, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location updated successfully.")
        |> redirect(to: Routes.location_path(conn, :show, location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Inventory.get_location!(id)
    {:ok, _location} = Inventory.delete_location(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: Routes.location_path(conn, :index))
  end
end

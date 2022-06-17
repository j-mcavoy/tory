defmodule ToryWeb.InventoryController do
  use ToryWeb, :controller

  alias Tory.Inventory
  alias Tory.Inventory.Inventory, as: I

  def index(conn, _params) do
    inventories = Inventory.list_inventories()
    render(conn, "index.html", inventories: inventories)
  end

  def new(conn, _params) do
    changeset = Inventory.change_inventory(%I{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inventory" => inventory_params}) do
    case Inventory.create_inventory(inventory_params) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory created successfully.")
        |> redirect(to: Routes.inventory_path(conn, :show, inventory))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inventory = Inventory.get_inventory_details!(id)
    render(conn, "show.html", inventory: inventory)
  end

  def edit(conn, %{"id" => id}) do
    inventory = Inventory.get_inventory!(id)
    changeset = Inventory.change_inventory(inventory)
    render(conn, "edit.html", inventory: inventory, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inventory" => inventory_params}) do
    inventory = Inventory.get_inventory!(id)

    case Inventory.update_inventory(inventory, inventory_params) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory updated successfully.")
        |> redirect(to: Routes.inventory_path(conn, :show, inventory))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", inventory: inventory, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inventory = Inventory.get_inventory!(id)
    {:ok, _inventory} = Inventory.delete_inventory(inventory)

    conn
    |> put_flash(:info, "Inventory deleted successfully.")
    |> redirect(to: Routes.inventory_path(conn, :index))
  end
end

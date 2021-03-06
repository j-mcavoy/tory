defmodule ToryWeb.InventoryLive.FormComponent do
  use ToryWeb, :live_component

  alias Tory.Part
  alias Tory.Location
  alias Tory.Inventory

  @impl true
  def update(%{inventory: inventory} = assigns, socket) do
    changeset = Inventory.change_inventory(inventory)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:parts, Enum.map(Part.list_parts(), &{&1.name, &1.id}))
     |> assign(:locations, Enum.map(Inventory.list_locations(), &{&1.name, &1.id}))}
  end

  @impl true
  def handle_event("validate", %{"inventory" => inventory_params}, socket) do
    IO.inspect(inventory_params)

    changeset =
      socket.assigns.inventory
      |> Inventory.change_inventory(inventory_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"inventory" => inventory_params}, socket) do
    save_inventory(socket, socket.assigns.action, inventory_params)
  end

  defp save_inventory(socket, :edit, inventory_params) do
    case Inventory.update_inventory(socket.assigns.inventory, inventory_params) do
      {:ok, _inventory} ->
        {:noreply,
         socket
         |> put_flash(:info, "inventory updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply,
         socket
         |> assign(:changeset, changeset)}
    end
  end

  defp save_inventory(socket, :new, inventory_params) do
    case Inventory.create_inventory(inventory_params) do
      {:ok, _inventory} ->
        {:noreply,
         socket
         |> put_flash(:info, "inventory created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

defmodule ToryWeb.InventoryLive.Index do
  use ToryWeb, :live_view

  alias Tory.Part
  alias Tory.Inventory
  alias Tory.Inventory.Inventory, as: I

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :inventories, Inventory.list_inventories_preloaded())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit inventory")
    |> assign(:inventory, Inventory.get_inventory_preloaded!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New inventory")
    |> assign(:inventory, %I{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing inventories")
    |> assign(:inventory, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    inventory = Inventory.get_inventory!(id)
    {:ok, _} = Inventory.delete_inventory(inventory)

    {:noreply, assign(socket, :inventories, Inventory.list_inventories())}
  end

  @impl true
  def handle_event("inc", %{"id" => id}, socket) do
    IO.puts("incr")
    Inventory.increment_inventory(id)
    {:noreply, assign(socket, :inventories, Inventory.list_inventories())}
  end

  @impl true
  def handle_event("dec", %{"id" => id}, socket) do
    Inventory.decrement_inventory(id)
    {:noreply, assign(socket, :inventories, Inventory.list_inventories())}
  end

  defp list_inventories do
    Inventory.list_inventories()
  end
end

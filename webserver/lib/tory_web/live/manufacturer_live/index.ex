defmodule ToryWeb.ManufacturerLive.Index do
  use ToryWeb, :live_view

  alias Tory.Inventory
  alias Tory.Inventory.Manufacturer

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :manufacturers, list_manufacturers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Manufacturer")
    |> assign(:manufacturer, Inventory.get_manufacturer!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Manufacturer")
    |> assign(:manufacturer, %Manufacturer{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Manufacturers")
    |> assign(:manufacturer, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    manufacturer = Inventory.get_manufacturer!(id)
    {:ok, _} = Inventory.delete_manufacturer(manufacturer)

    {:noreply, assign(socket, :manufacturers, list_manufacturers())}
  end

  defp list_manufacturers do
    Inventory.list_manufacturers()
  end
end

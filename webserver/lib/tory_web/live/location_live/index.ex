defmodule ToryWeb.LocationLive.Index do
  use ToryWeb, :live_view

  alias Tory.Inventory
  alias Tory.Inventory.Location

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :locations, list_locations())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Location")
    |> assign(:location, Inventory.get_location!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Location")
    |> assign(:location, %Location{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Locations")
    |> assign(:location, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    location = Inventory.get_location!(id)
    {:ok, _} = Inventory.delete_location(location)

    {:noreply, assign(socket, :locations, list_locations())}
  end

  defp list_locations do
    Inventory.list_locations()
  end
end

defmodule ToryWeb.InventoryLive.Show do
  use ToryWeb, :live_view

  alias Tory.Repo
  alias Tory.Inventory

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:inventory, Inventory.get_inventory!(id) |> Repo.preload([:part, :location]))}
  end

  defp page_title(:show), do: "Show inventory"
  defp page_title(:edit), do: "Edit inventory"
end

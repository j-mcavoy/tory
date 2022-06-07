defmodule ToryWeb.DistributorLive.Show do
  use ToryWeb, :live_view

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
     |> assign(:distributor, Inventory.get_distributor!(id))}
  end

  defp page_title(:show), do: "Show distributor"
  defp page_title(:edit), do: "Edit distributor"
end

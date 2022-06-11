defmodule ToryWeb.PartLive.Show do
  use ToryWeb, :live_view

  alias Tory.Inventory

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    part = Inventory.get_part!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:part, part)
     |> assign(:barcode_generated, Inventory.generate_barcode(part))}
  end

  defp page_title(:show), do: "Show Part"
  defp page_title(:edit), do: "Edit Part"
end

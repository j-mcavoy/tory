defmodule ToryWeb.PartLive.Show do
  use ToryWeb, :live_view

  alias Tory.Part

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:part, Part.get_part_preloaded!(id))}
  end

  defp page_title(:show), do: "Show part"
  defp page_title(:edit), do: "Edit part"
end

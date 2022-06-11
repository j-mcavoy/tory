defmodule ToryWeb.PartLive.Index do
  use ToryWeb, :live_view

  alias Tory.Inventory
  alias Tory.Inventory.Part

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :part_collection, list_part())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Part")
    |> assign(:part, Inventory.get_part!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Part")
    |> assign(:part, %Part{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Part")
    |> assign(:part, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    part = Inventory.get_part!(id)
    {:ok, _} = Inventory.delete_part(part)

    {:noreply, assign(socket, :part_collection, list_part())}
  end

  defp list_part do
    Inventory.list_part()
  end

  def list_distributors(part) do
    Enum.map(part.distributors, & &1.name) |> Enum.intersperse(", ") |> Enum.join()
  end
end

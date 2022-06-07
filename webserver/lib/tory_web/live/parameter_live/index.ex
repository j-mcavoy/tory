defmodule ToryWeb.ParameterLive.Index do
  use ToryWeb, :live_view

  alias Tory.Inventory
  alias Tory.Inventory.Parameter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :parameters, list_parameters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Parameter")
    |> assign(:parameter, Inventory.get_parameter!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Parameter")
    |> assign(:parameter, %Parameter{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Parameters")
    |> assign(:parameter, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    parameter = Inventory.get_parameter!(id)
    {:ok, _} = Inventory.delete_parameter(parameter)

    {:noreply, assign(socket, :parameters, list_parameters())}
  end

  defp list_parameters do
    Inventory.list_parameters()
  end
end

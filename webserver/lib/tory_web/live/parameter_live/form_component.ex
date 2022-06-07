defmodule ToryWeb.ParameterLive.FormComponent do
  use ToryWeb, :live_component

  alias Tory.Inventory

  @impl true
  def update(%{parameter: parameter} = assigns, socket) do
    changeset = Inventory.change_parameter(parameter)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"parameter" => parameter_params}, socket) do
    changeset =
      socket.assigns.parameter
      |> Inventory.change_parameter(parameter_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"parameter" => parameter_params}, socket) do
    save_parameter(socket, socket.assigns.action, parameter_params)
  end

  defp save_parameter(socket, :edit, parameter_params) do
    case Inventory.update_parameter(socket.assigns.parameter, parameter_params) do
      {:ok, _parameter} ->
        {:noreply,
         socket
         |> put_flash(:info, "Parameter updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_parameter(socket, :new, parameter_params) do
    case Inventory.create_parameter(parameter_params) do
      {:ok, _parameter} ->
        {:noreply,
         socket
         |> put_flash(:info, "Parameter created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

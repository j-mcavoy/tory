defmodule ToryWeb.ManufacturerLive.FormComponent do
  use ToryWeb, :live_component

  alias Tory.Inventory

  @impl true
  def update(%{manufacturer: manufacturer} = assigns, socket) do
    changeset = Inventory.change_manufacturer(manufacturer)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"manufacturer" => manufacturer_params}, socket) do
    changeset =
      socket.assigns.manufacturer
      |> Inventory.change_manufacturer(manufacturer_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"manufacturer" => manufacturer_params}, socket) do
    save_manufacturer(socket, socket.assigns.action, manufacturer_params)
  end

  defp save_manufacturer(socket, :edit, manufacturer_params) do
    case Inventory.update_manufacturer(socket.assigns.manufacturer, manufacturer_params) do
      {:ok, _manufacturer} ->
        {:noreply,
         socket
         |> put_flash(:info, "Manufacturer updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_manufacturer(socket, :new, manufacturer_params) do
    case Inventory.create_manufacturer(manufacturer_params) do
      {:ok, _manufacturer} ->
        {:noreply,
         socket
         |> put_flash(:info, "Manufacturer created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

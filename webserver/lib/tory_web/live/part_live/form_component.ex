defmodule ToryWeb.PartLive.FormComponent do
  use ToryWeb, :live_component

  alias Tory.Inventory

  @impl true
  def update(%{part: part} = assigns, socket) do
    changeset = Inventory.change_part(part)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"part" => part_params}, socket) do
    changeset =
      socket.assigns.part
      |> Inventory.change_part(part_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"part" => part_params}, socket) do
    save_part(socket, socket.assigns.action, part_params)
  end

  defp save_part(socket, :edit, part_params) do
    case Inventory.update_part(socket.assigns.part, part_params) do
      {:ok, _part} ->
        {:noreply,
         socket
         |> put_flash(:info, "Part updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_part(socket, :new, part_params) do
    case Inventory.create_part(part_params) do
      {:ok, _part} ->
        {:noreply,
         socket
         |> put_flash(:info, "Part created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

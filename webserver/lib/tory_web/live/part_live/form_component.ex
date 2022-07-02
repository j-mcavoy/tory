defmodule ToryWeb.PartLive.FormComponent do
  use ToryWeb, :live_component

  alias Tory.Part

  @impl true
  def update(%{part: part} = assigns, socket) do
    changeset = Part.change_part(part)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:octopart_search_results, assigns.octopart_search_results || nil)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"part" => part_params}, socket) do
    changeset =
      socket.assigns.part
      |> Part.change_part(part_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"part" => part_params}, socket) do
    save_part(socket, socket.assigns.action, part_params)
  end

  defp save_part(socket, :edit, part_params) do
    case Part.update_part(socket.assigns.part, part_params) do
      {:ok, _part} ->
        {:noreply,
         socket
         |> put_flash(:info, "part updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp save_part(socket, :new, part_params) do
    case Part.create_part(part_params) do
      {:ok, _part} ->
        {:noreply,
         socket
         |> put_flash(:info, "part created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

defmodule ToryWeb.PartLive.Index do
  use ToryWeb, :live_view

  alias Tory.Part
  alias Tory.Part.Part, as: P

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :parts, Part.list_parts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    part = Part.get_part!(id)
    {:ok, _} = Part.delete_part(part)

    {:noreply, assign(socket, :parts, Part.list_parts())}
  end

  defp apply_action(socket, :octopart_search, %{
         "part" => part
       }) do
    IO.puts("searching octopart")
    IO.puts(part.id)
    part = Tory.Part.get_part_preloaded!(part.id)
    octopart_search_results = Tory.Octopart.search_octopart(part)

    socket
    |> assign(:page_title, "Octopart Search Results part")
    |> assign(:octopart_search_results, octopart_search_results)
    |> assign(:part, Part.get_part_preloaded!(part.id))
  end

  defp apply_action(socket, :edit, %{
         "id" => id
       }) do
    socket
    |> assign(:page_title, "Edit part")
    |> assign(:part, Part.get_part_preloaded!(id))
  end

  defp apply_action(socket, :octopart_search, %{"id" => id}) do
    part = Tory.Part.get_part_preloaded!(id)
    results = Tory.Octopart.search_octopart(part)

    apply_action(socket, :octopart_search, %{"id" => id, "octopart_search_results" => results})
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New part")
    |> assign(:part, %P{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Parts")
    |> assign(:part, nil)
  end
end

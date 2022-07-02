defmodule ToryWeb.PartLive.Index do
  use ToryWeb, :live_view

  alias Tory.Part
  alias Tory.Part.Part, as: P

  def handle_event("search_octopart", %{"part_id" => part_id}, socket) do
    import Tory.Octopart
    IO.puts("octopart search")
    part = Part.get_part_preloaded!(part_id)
    IO.inspect(part_id)
    octopart_search_results = fetch_meta_from_octopart(part) |> parse_octopart_json
    IO.inspect(octopart_search_results)
    # new_part = Part.get_part_preloaded!(part.id)
    # {:noreply, assign(socket, :part, new_part)}
    {:noreply,
     assign(socket, :octopart_search_results, [octopart_search_results])
     |> Map.put(:action, :edit)}
  end

  def handle_event("populate_octopart", %{"part_id" => part_id}, socket) do
    IO.puts("octopart populate")
    part = Part.get_part_preloaded!(part_id)
    IO.inspect(part_id)
    octopart = Tory.Octopart.populate_octopart_data(part)
    # new_part = Part.get_part_preloaded!(part.id)
    # {:noreply, assign(socket, :part, new_part)}
    {:noreply, assign(socket, :part, octopart)}
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :parts, list_parts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{
         "id" => id,
         "octopart_search_results" => octopart_search_results
       }) do
    socket
    |> assign(:page_title, "Edit part")
    |> assign(:octopart_search_results, octopart_search_results)
    |> assign(:part, Part.get_part_preloaded!(id))
  end

  defp apply_action(socket, :edit, %{"id" => id}),
    do: apply_action(socket, :edit, %{"id" => id, "octopart_search_results" => nil})

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

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    part = Part.get_part!(id)
    {:ok, _} = Part.delete_part(part)

    {:noreply, assign(socket, :parts, list_parts())}
  end

  defp list_parts do
    Part.list_parts()
  end
end

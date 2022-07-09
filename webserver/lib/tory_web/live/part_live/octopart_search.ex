defmodule ToryWeb.PartLive.OctopartSearch do
  use ToryWeb, :live_view

  alias Tory.Part
  alias Tory.Part.Part, as: P
  alias Tory.Octopart

  @search_result_limit 1

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    IO.puts("searching octopart")
    part = Tory.Part.get_part_preloaded!(id)
    octopart_search_results = Tory.Octopart.search_octopart(part, @search_result_limit)

    {:noreply,
     socket
     |> assign(:part_id, id)
     |> assign(:octopart_search_results, octopart_search_results)
     |> assign(:page_title, "Octopart Search")}
  end

  def handle_event("populate", %{"part-id" => part_id, "octopart-id" => octopart_id}, socket) do
    part = Part.get_part_preloaded!(part_id)
    {:ok, [part_result | _]} = Octopart.search_octopart(%P{part | octopart_id: octopart_id})
    Octopart.insert_part_result(part_result, part)
    {:noreply, socket}
  end
end

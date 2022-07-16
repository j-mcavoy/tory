defmodule Tory.Octopart do
  import NexarApi

  alias Neuron

  alias Ecto
  alias Tory.Repo
  alias Tory.Part
  alias Tory.Part.Part, as: P

  def update_part_from_octopart(%P{} = part) do
    result = hd(search_octopart(part))
    update_part_from_octopart(part, result)
  end

  def update_part_from_octopart(%P{} = part, %{} = result) do
    change =
      P.changeset(part, result)
      |> Ecto.Changeset.foreign_key_constraint(:spec, name: :attributes_spec_id_fkey)

    Repo.insert_or_update(change)
    Tory.Part.get_part_preloaded!(part.id)
  end

  def search_octopart(%P{} = part), do: search_octopart(part, 1)

  def search_octopart(%P{octopart_id: nil, mpn: mpn}, limit) when limit > 0 do
    resp =
      """
      query PartSearch($q: String!, $limit: Int!) {
      supSearchMpn(q: $q, limit: $limit){
      results{
        part{
          id
          name
          mpn
          genericMpn
          manufacturer { id name homepageUrl isVerified isDistributorApi displayFlag slug aliases }
          manufacturerUrl
          shortDescription
          specs { displayValue units value attribute { name shortname group } }
          slug
          octopartUrl
          bestImage { url }
          bestDatasheet { url }
          totalAvail
          avgAvail
          estimatedFactoryLeadDays
          freeSampleUrl
          akaMpns
      } } } }
      """
      |> query(%{q: mpn, limit: limit})

    {:ok, %{body: %{data: %{supSearchMpn: %{results: raw_results}}}}} = resp
    Enum.map(raw_results, & &1.part) |> rename_raw_results
  end

  def search_octopart(%P{octopart_id: octopart_id}, _limit) do
    resp =
      """
      query PartSearch($id: String!) {
      supParts(ids: [$id]){
          id
          name
          mpn
          genericMpn
          manufacturer { id name homepageUrl isVerified isDistributorApi displayFlag slug aliases }
          manufacturerUrl
          shortDescription
          specs { displayValue units value attribute { name shortname group } }
          slug
          octopartUrl
          bestImage { url }
          bestDatasheet { url }
          totalAvail
          avgAvail
          estimatedFactoryLeadDays
          freeSampleUrl
          akaMpns
      } }
      """
      |> query(%{id: octopart_id})

    {:ok, %{body: %{data: %{supParts: raw_results}}}} = resp
    rename_raw_results(raw_results)
  end

  defp rename_raw_results(raw_results) do
    for r <- raw_results do
      %{
        octopart_id: r.id,
        name: r.name,
        mpn: r.mpn,
        generic_mpn: r.genericMpn,
        company: %{
          octopart_id: r.manufacturer.id,
          name: r.manufacturer.name,
          homepage_url: r.manufacturer.homepageUrl,
          is_verified: r.manufacturer.isVerified,
          is_distributorapi: r.manufacturer.isDistributorApi,
          displayFlag: r.manufacturer.displayFlag,
          slug: r.manufacturer.slug,
          aliases: Enum.map(r.manufacturer.aliases, &%{alias: &1})
        },
        manufacturer_url: r.manufacturerUrl,
        short_description: r.shortDescription,
        specs:
          Enum.map(
            r.specs,
            &%{
              display_value: &1.displayValue,
              units: &1.units,
              value: &1.value,
              attribute: &1.attribute
            }
          ),
        slug: r.slug,
        octopart_url: r.octopartUrl,
        image: (not is_nil(r.bestImage) && r.bestImage.url) || nil,
        datasheet: (not is_nil(r.bestDatasheet) && r.bestDatasheet.url) || nil,
        total_avail: r.totalAvail,
        avg_avail: r.avgAvail,
        estimated_factory_lead_days: r.estimatedFactoryLeadDays,
        free_sample_url: r.freeSampleUrl,
        aka_mpns: r.akaMpns
      }
    end
  end
end

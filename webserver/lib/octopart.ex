defmodule Tory.Octopart do
  alias Tory.Part.{Part, PartSpec, AkaMpn}
  alias Tory.Meta.{Attribute, Spec}
  alias Tory.Company.Company
  alias Neuron
  alias Tory.Repo

  def octopart_token, do: System.get_env("OCTOPART_APIKEY")

  @octopart_endpoint 'https://octopart.com/api/v4/endpoint'

  # @options [ssl: [verify: :verify_none]]

  def fetch_meta_from_octopart(%Part{id: id, octopart_id: octopart_id, mpn: mpn}) do
    IO.puts(mpn)

    Neuron.Config.set(parse_options: [keys: :atoms])

    resp =
      """
      query($q: String) {
        search(q: $q, limit: 1) {
          results {
            part {
              avg_avail
              total_avail
              estimated_factory_lead_days
              free_sample_url
              id
              mpn
              slug
              name
              short_description
              aka_mpns
              generic_mpn
              manufacturer_url
              octopart_url
              best_datasheet { url }
              best_image { url }
              manufacturer { id name homepage_url is_verified is_distributorapi display_flag slug}
              specs {
                display_value
                units
                value
                attribute {name shortname group}
              }

            } } } }
      """
      |> IO.inspect()
      |> Neuron.query(
        %{q: mpn},
        url: @octopart_endpoint,
        headers: [token: octopart_token()]
      )

    IO.inspect(resp)

    {:ok, %{body: %{data: %{search: %{results: [result | _]}}}}} = resp
    result
  end

  def parse_octopart_part_query(
        %{
          part: %{
            id: octopart_id,
            name: name,
            mpn: mpn,
            short_description: short_description,
            aka_mpns: aka_mpns,
            generic_mpn: generic_mpn,
            avg_avail: avg_avail,
            total_avail: total_avail,
            slug: slug,
            manufacturer_url: manufacturer_url,
            octopart_url: octopart_url,
            best_datasheet: %{url: datasheet},
            best_image: %{url: image},
            manufacturer: company,
            specs: specs
          }
        },
        part_id
      ) do
    mpns = Enum.map(aka_mpns, &%{part_id: part_id, mpn: &1})

    specs =
      Enum.map(
        specs,
        &%{
          value: &1.value,
          units: &1.units,
          display_value: &1.display_value,
          attribute: %{
            group: &1.attribute.group,
            name: &1.attribute.name,
            shortname: &1.attribute.shortname
          }
        }
      )

    company = %{
      octopart_id: company.id,
      name: company.name,
      homepage_url: company.homepage_url,
      is_verified: company.is_verified,
      is_distributorapi: company.is_distributorapi,
      display_flag: company.display_flag,
      slug: company.slug
    }

    part = %{
      id: part_id,
      octopart_id: octopart_id,
      name: name,
      short_description: short_description,
      generic_mpn: generic_mpn,
      mpn: mpn,
      aka_mpns: mpns,
      octopart_url: octopart_url,
      manufacturer_url: manufacturer_url,
      datasheet: datasheet,
      image: image,
      avg_avail: avg_avail,
      total_avail: total_avail,
      slug: slug,
      specs: specs,
      company: company
    }

    # %{mpns: mpns, specs: specs, company: company, part: part}
    part
  end

  # def insert_octopart_data(%{mpns: mpns, specs: specs, company: company, part: part}) do
  def insert_octopart_data(%{} = part) do
    Tory.Part.upsert_part(part)
  end
end

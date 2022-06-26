defmodule Tory.Octopart do
  alias Tory.Part.{Part, PartSpec, AkaMpn}
  alias Tory.Meta.{Attribute, Spec}
  alias Tory.Company.Company
  alias Neuron
  alias Tory.Repo

  def octopart_token, do: System.get_env("OCTOPART_APIKEY")

  @octopart_endpoint 'https://octopart.com/api/v4/endpoint'

  def populate_octopart_data(%Part{} = part) do
    fetch_meta_from_octopart(part)
    |> parse_octopart_json
    |> parse_octopart_part_query(part.id)
    |> insert_octopart_data(part)
  end

  # @options [ssl: [verify: :verify_none]]

  defp octopart_api_fetch(query, %{} = vars) do
    Neuron.query(
      query,
      vars,
      url: @octopart_endpoint,
      headers: [token: octopart_token()]
    )
  end

  def fetch_meta_from_octopart(%Part{octopart_id: nil, mpn: mpn}) do
    Neuron.Config.set(parse_options: [keys: :atoms])

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
            manufacturer { id name homepage_url is_verified is_distributorapi display_flag slug aliases}
            specs { display_value units value attribute {name shortname group} }
    } } } }
    """
    |> octopart_api_fetch(%{q: mpn})
  end

  def fetch_meta_from_octopart(%Part{octopart_id: octopart_id}) do
    Neuron.Config.set(parse_options: [keys: :atoms])

    """
      query($id: String!) {
        parts(ids: [$id]) {
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
          manufacturer { id name homepage_url is_verified is_distributorapi display_flag slug aliases }
          specs { display_value units value attribute { name shortname group } }
    } }
    """
    |> octopart_api_fetch(%{id: octopart_id})
  end

  def parse_octopart_json({:ok, %{body: %{data: %{search: %{results: [result | _]}}}}}),
    do: result

  def parse_octopart_json({:ok, %{body: %{data: %{parts: [result | _]}}}}),
    do: result

  def parse_octopart_specs_query(specs) do
    Enum.map(
      specs,
      fn %{attribute: a} = s ->
        a? = Repo.get_by(Attribute, group: a.group, name: a.name, shortname: a.shortname)

        if not is_nil(a?) do
          IO.inspect(a?.id)
          attribute = Map.put(a, :id, a?.id)
          s? = Repo.get_by(Spec, value: s.value, attribute_id: a?.id)

          if not is_nil(s?) do
            %{
              id: s?.id,
              value: s.value,
              units: s.units,
              display_value: s.display_value,
              attribute: attribute
            }
          else
            %{
              value: s.value,
              units: s.units,
              display_value: s.display_value,
              attribute: attribute
            }
          end
        else
          %{
            value: s.value,
            units: s.units,
            display_value: s.display_value,
            attribute: a
          }
        end
      end
    )
  end

  alias Tory.Company.CompanyAlias

  def parse_octopart_company_query(%{aliases: aliases} = company) do
    aliases =
      Enum.map(aliases, fn a ->
        IO.inspect(a)
        a? = Repo.get_by(CompanyAlias, alias: a)

        if not is_nil(a?) do
          %{alias: a, id: a?.id}
        else
          %{alias: a}
        end
      end)

    c? = Repo.get_by(Company, name: company.name)

    if not is_nil(c?) do
      %{
        id: c?.id,
        octopart_id: company.id,
        name: company.name,
        homepage_url: company.homepage_url,
        is_verified: company.is_verified,
        is_distributorapi: company.is_distributorapi,
        display_flag: company.display_flag,
        slug: company.slug,
        aliases: aliases
      }
    else
      %{
        octopart_id: company.id,
        name: company.name,
        homepage_url: company.homepage_url,
        is_verified: company.is_verified,
        is_distributorapi: company.is_distributorapi,
        display_flag: company.display_flag,
        slug: company.slug,
        aliases: aliases
      }
    end
  end

  def parse_octopart_part_query(
        %{
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
        } = part,
        part_id
      ),
      do:
        parse_octopart_part_query(
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
        )

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

    specs = parse_octopart_specs_query(specs)

    company = parse_octopart_company_query(company)

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

    part
  end

  def insert_octopart_data(octopart, old_part) do
    change = Part.changeset(old_part, octopart)
    IO.inspect(change)

    Repo.insert_or_update(change)
  end
end

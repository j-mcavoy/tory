defmodule Tory.Octopart do
  alias Neuron
  alias Tory.Company.Company
  alias Tory.Company.CompanyAlias
  alias Tory.Meta.{Attribute, Spec}
  alias Tory.Octopart.Api.PartResult
  alias Tory.Part.{Part, PartSpec}
  alias Tory.Repo

  import Tory.Octopart.Api

  @spec populate_octopart_data(%Part{}) :: {:ok, %Part{}} | {:error, any}
  def populate_octopart_data(%Part{} = part) do
    case search_octopart(part) do
      {:ok, [first_part | _]} -> insert_octopart_data(first_part, part)
      resp -> resp
    end
  end

  @spec search_octopart(%Part{octopart_id: nil}) :: {:ok, [PartResult]} | {:error, any}
  def search_octopart(%Part{octopart_id: nil, mpn: _mpn} = part), do: search_octopart(part, 1)

  @spec search_octopart(Part) :: {:ok, [PartResult]} | {:error, any}
  def search_octopart(%Part{octopart_id: octopart_id}) do
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

  @spec search_octopart(%Part{octopart_id: nil, mpn: String.t()}, integer) ::
          {:ok, [PartResult]} | {:error, any}
  def search_octopart(%Part{octopart_id: nil, mpn: mpn}, limit) do
    """
    query($q: String, $limit: Int) {
      search(q: $q, limit: $limit) {
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
    |> octopart_api_fetch(%{q: mpn, limit: limit})
  end

  @spec parse_part_result(PartResult, integer) :: Part
  defp parse_part_result(
         %PartResult{
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
         },
         part_id
       ) do
    mpns = Enum.map(aka_mpns, &%{part_id: part_id, mpn: &1})

    specs = parse_specs(specs, part_id)

    company = parse_company(company)

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

  @spec parse_specs([PartResult.Spec.t()], integer) :: [Spec]
  def parse_specs([%PartResult.Spec{}] = specs, part_id) do
    Enum.map(
      specs,
      fn %{attribute: a} = s ->
        import Ecto.Query

        a? = Repo.get_by(Attribute, group: a.group, name: a.name, shortname: a.shortname)

        if not is_nil(a?) do
          IO.inspect(a?.id)

          s? =
            Repo.one(
              from s in Spec,
                join: ps in PartSpec,
                on: ps.spec_id == s.id,
                join: p in Part,
                on: ps.part_id == p.id,
                where:
                  p.id == ^part_id and s.attribute_id == ^a?.id and
                    s.display_value == ^s.display_value and
                    s.value == ^s.value,
                distinct: s.id,
                select: s
            )

          IO.inspect(s?)

          if not is_nil(s?) do
            %{
              id: s?.id,
              value: s.value,
              units: s.units,
              display_value: s.display_value,
              attribute_id: a?.id
            }
          else
            %{
              value: s.value,
              units: s.units,
              display_value: s.display_value,
              attribute_id: a?.id
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

  def parse_company(%{aliases: aliases} = company) do
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
        },
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

  def insert_octopart_data(octopart, old_part) do
    change = Part.changeset(old_part, octopart)
    IO.inspect(change)

    Repo.insert_or_update(change)
  end
end

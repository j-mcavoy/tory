defmodule Tory.Octopart do
  import Tory.Octopart.Api

  alias Neuron
  alias Tory.Company.Company
  alias Tory.Company.CompanyAlias
  alias Tory.Meta.{Attribute, Spec}
  alias Tory.Octopart.Api.PartResult
  alias Tory.Part.{Part, PartSpec}

  alias Tory.Repo
  @spec insert_part_result(PartResult, Part) :: :ok
  def insert_part_result(%PartResult{} = part_result, %Part{} = old_part) do
    changeset = parse_part_result(part_result, old_part.id)
    IO.puts("#################")
    IO.puts("parsed_octopart")
    IO.inspect(changeset)
    Repo.insert_or_update(changeset)
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
  def search_octopart(%Part{octopart_id: nil, mpn: mpn}, limit) when limit > 0 do
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

  @spec parse_part_result(PartResult.t(), integer) :: Repo.Changeset.t()
  def parse_part_result(
        %PartResult{} = pr,
        part_id
      ) do
    pr_map = PartResult.into_map(pr)

    attrs =
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
        company: company,
        specs: specs
      } = pr_map

    part = Tory.Part.get_part_preloaded!(part_id)
    Part.changeset(part, attrs)
    # mpns = Enum.map(aka_mpns, &%{part_id: part_id, mpn: &1})

    # specs = parse_specs(specs, part_id)

    # part = %Part{
    #  id: part_id,
    #  octopart_id: octopart_id,
    #  name: name,
    #  short_description: short_description,
    #  generic_mpn: generic_mpn,
    #  mpn: mpn,
    #  # aka_mpns: mpns,
    #  octopart_url: octopart_url,
    #  manufacturer_url: manufacturer_url,
    #  datasheet: datasheet,
    #  image: image,
    #  avg_avail: avg_avail,
    #  total_avail: total_avail,
    #  slug: slug,
    #  specs: parse_specs(specs, part_id),
    #  company: company
    # }

    # part
  end

  @spec parse_specs([map], integer) :: [Spec]
  def parse_specs(specs, part_id) do
    out =
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
              %Spec{
                id: s?.id,
                value: s.value,
                units: s.units,
                display_value: s.display_value,
                attribute_id: a?.id
              }
            else
              %Spec{
                value: s.value,
                units: s.units,
                display_value: s.display_value,
                attribute_id: a?.id
              }
            end
          else
            %Spec{
              value: s.value,
              units: s.units,
              display_value: s.display_value,
              attribute: a
            }
          end
        end
      )

    IO.inspect(out, limit: :infinity)
    out
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
          datasheet: %{url: datasheet},
          image: %{url: image},
          company: company,
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
              datasheet: %{url: datasheet},
              image: %{url: image},
              company: company,
              specs: specs
            }
          },
          part_id
        )
end

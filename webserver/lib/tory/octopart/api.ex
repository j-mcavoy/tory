defmodule Tory.Octopart.Api do
  alias Tory.Octopart.Api.PartResult
  def octopart_token, do: System.get_env("OCTOPART_APIKEY")

  @octopart_endpoint 'https://octopart.com/api/v4/endpoint'
  @type search_response :: %{body: %{data: %{search: %{results: [PartResult.t()]}}}}
  @type parts_response :: %{body: %{data: %{parts: [PartResult.t()]}}}
  @type error_response :: {:error, HTTPoison.Error | Neuron.JSONParseError}

  @spec octopart_api_fetch(String.t(), map()) ::
          {:ok, [PartResult]} | {:error, any}
  def octopart_api_fetch(query, %{} = vars) do
    Neuron.Config.set(parse_options: [keys: :atoms])

    with {:ok, resp} <-
           Neuron.query(
             query,
             vars,
             url: @octopart_endpoint,
             headers: [token: octopart_token()]
           ) do
      {:ok, parse_octopart_json(%{body: resp.body})}
    else
      {:error, e} -> {:error, e}
    end
  end

  @spec parse_octopart_json(search_response) :: [PartResult]
  defp parse_octopart_json(%{body: %{data: %{search: %{results: part_results}}}}),
    do:
      Enum.map(
        part_results,
        &%PartResult{
          id: &1.part.id,
          name: &1.part.name,
          mpn: &1.part.mpn,
          short_description: &1.part.short_description,
          aka_mpns: &1.part.aka_mpns,
          generic_mpn: &1.part.generic_mpn,
          avg_avail: &1.part.avg_avail,
          total_avail: &1.part.total_avail,
          slug: &1.part.slug,
          manufacturer_url: &1.part.manufacturer_url,
          octopart_url: &1.part.octopart_url,
          best_datasheet: &1.part.best_datasheet,
          best_image: &1.part.best_image,
          manufacturer: &1.part.manufacturer,
          specs: &1.part.specs
        }
      )

  @spec parse_octopart_json(parts_response) :: [PartResult]
  defp parse_octopart_json(%{body: %{data: %{parts: part_results}}}),
    do:
      Enum.map(
        part_results,
        &%PartResult{
          id: &1.id,
          name: &1.name,
          mpn: &1.mpn,
          short_description: &1.short_description,
          aka_mpns: &1.aka_mpns,
          generic_mpn: &1.generic_mpn,
          avg_avail: &1.avg_avail,
          total_avail: &1.total_avail,
          slug: &1.slug,
          manufacturer_url: &1.manufacturer_url,
          octopart_url: &1.octopart_url,
          best_datasheet: &1.best_datasheet,
          best_image: &1.best_image,
          manufacturer: &1.manufacturer,
          specs: &1.specs
        }
      )
end

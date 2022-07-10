defmodule Tory.Octopart.Api do
  alias Tory.Octopart.Api.PartResult
  alias Tory.Octopart.Api.PartResult.{Spec, Company}
  alias Tory.Octopart.Api.PartResult.Company.Alias
  alias Tory.Octopart.Api.PartResult.Spec.Attribute
  def octopart_token, do: System.get_env("OCTOPART_APIKEY")

  def octopart_api_queries_cache, do: :octopart_api_queries

  @octopart_endpoint 'https://octopart.com/api/v4/endpoint'
  @type search_response :: %{body: %{data: %{search: %{results: [PartResult.t()]}}}}
  @type parts_response :: %{body: %{data: %{parts: [PartResult.t()]}}}
  @type error_response :: {:error, HTTPoison.Error | Neuron.JSONParseError}

  @spec octopart_api_fetch(String.t(), map()) :: {:ok, [PartResult]} | {:error, any}
  def octopart_api_fetch(query, %{} = vars) do
    require Cachex

    key = %{query: query, vars: vars}

    case Cachex.get(octopart_api_queries_cache(), key) do
      {:ok, nil} ->
        Neuron.Config.set(parse_options: [keys: :atoms])

        with {:ok, resp} <-
               Neuron.query(
                 query,
                 vars,
                 url: @octopart_endpoint,
                 headers: [token: octopart_token()]
               ) do
          pr = parse_octopart_json(%{body: resp.body})
          results = parse_part_results(pr)
          {:ok, _} = Cachex.put(octopart_api_queries_cache(), key, results)

          {:ok, _} = Cachex.dump(octopart_api_queries_cache(), "priv/cache/octopart_api_queries")

          {:ok, results}
        else
          {:error, e} -> {:error, e}
        end

      {:ok, results} ->
        {:ok, results}

      _ ->
        {:error, nil}
    end
  end

  @spec parse_octopart_json(search_response) :: [PartResult]
  defp parse_octopart_json(%{body: %{data: %{search: %{results: part_results}}}}),
    do: parse_part_results(part_results)

  @spec parse_octopart_json(parts_response) :: [PartResult]
  defp parse_octopart_json(%{body: %{data: %{parts: part_results}}}),
    do: parse_part_results(part_results)

  defp parse_part_results(part_results) do
    Enum.map(
      part_results,
      fn p ->
        # IO.puts("p = ", p)

        p =
          if Map.has_key?(p, :part) do
            p.part
          else
            p
          end

        specs =
          Enum.map(p.specs, fn s ->
            a = Map.merge(%Attribute{}, s.attribute)
            spec = Map.merge(%Spec{}, s)
            %Spec{spec | attribute: a}
          end)

        part_result = Map.merge(%PartResult{}, p)
        company = Map.merge(%Company{}, p.manufacturer)
        company = %{company | aliases: Enum.map(company.aliases, &%Alias{alias: &1})}

        %PartResult{
          part_result
          | specs: specs,
            company: company,
            datasheet: p.best_datasheet.url,
            image: p.best_image.url,
            avg_avail: p.avg_avail * 1.0
        }
      end
    )
  end
end

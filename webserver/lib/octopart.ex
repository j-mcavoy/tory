defmodule Tory.Octopart do
  alias Tory.Inventory.Part
  alias Neuron

  @octopart_token System.get_env("OCTOPART_APIKEY")
  @octopart_endpoint 'https://octopart.com/api/v4/endpoint'

  @options [ssl: [versions: [:"tlsv1.2"]], hackney: [:insecure], recv_timeout: 500]
  # @options [ssl: [verify: :verify_none]]

  def fetch_meta_from_octopart(%Part{octopart_uuid: uid, mpn: mpn}) do
    IO.puts(mpn)

    resp =
      """
      query($q: String) {
        search(q: $q, limit: 1) {
          results {
            part {
              manufacturer {
                name
                homepage_url
              }
              manufacturer_url
              id
              octopart_url
              aka_mpns
              generic_mpn
              images {
                url
              }
              best_datasheet {
                url
              }
            }
          }
        }
      }
      """
      |> IO.inspect()
      |> Neuron.query(
        %{q: mpn},
        url: @octopart_endpoint,
        headers: [token: @octopart_token]
      )

    IO.inspect(resp)

    {:ok, %{body: %{"data" => %{"search" => %{"results" => [result | _]}}}}} = resp
    result
  end
end

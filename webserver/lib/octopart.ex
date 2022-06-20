defmodule Tory.Octopart do
  alias Tory.Inventory.Part

  require GraphqlBuilder
  require HTTPoison

  alias GraphqlBuilder.Query

  @octopart_token System.get_env("OCTOPART_API_KEY")
  @octopart_endpoint 'https://octopart.com/api/v4/endpoint'

  @options [ssl: [versions: [:"tlsv1.2"]], hackney: [:insecure], recv_timeout: 500]
  # @options [ssl: [verify: :verify_none]]

  def fetch_meta_from_octopart(%Part{octopart_uuid: uid} = part) do
    body = %{
      operation: nil,
      query:
        'search(q: "2k2 5% 500mW", limit: 1) { results { part { mpn manufacturer { name } } } }'
    }

    b =
      '{"operationName":null,"variables":{},"query":"{ search(q: \\"2k2 5% 500mW\\", limit: 1) { results { part { mpn manufacturer { name } } } } } "} '

    headers = [
      # {'Content-Type', 'application/json'},
      # {'Host', '*'},
      {"token", @octopart_token},
      {"Accept", "application/json"},
      # {"Accept-Encoding", "gzip, deflate, br"},
      {"Content-Type", "application/json"},
      {"Content-Length", length(b)}
    ]

    HTTPoison.post(
      @octopart_endpoint,
      b,
      headers,
      @options
    )
  end
end

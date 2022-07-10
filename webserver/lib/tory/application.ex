defmodule Tory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tory.Repo,
      # Start the Telemetry supervisor
      ToryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tory.PubSub},
      # Start the Endpoint (http/https)
      ToryWeb.Endpoint
      # Start a worker by calling: Tory.Worker.start_link(arg)
      # {Tory.Worker, arg}
    ]

    # setup Cachex cache
    require Cachex

    IO.puts("Starting Cachex cache")

    Cachex.start(Tory.Octopart.Api.octopart_api_queries_cache())

    Cachex.load(
      Tory.Octopart.Api.octopart_api_queries_cache(),
      "priv/cache/octopart_api_queries"
    )

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tory.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ToryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

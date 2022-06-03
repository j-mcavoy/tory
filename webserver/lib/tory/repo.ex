defmodule Tory.Repo do
  use Ecto.Repo,
    otp_app: :tory,
    adapter: Ecto.Adapters.Postgres
end

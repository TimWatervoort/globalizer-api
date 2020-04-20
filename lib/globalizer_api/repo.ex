defmodule GlobalizerApi.Repo do
  use Ecto.Repo,
    otp_app: :globalizer_api,
    adapter: Ecto.Adapters.Postgres
end

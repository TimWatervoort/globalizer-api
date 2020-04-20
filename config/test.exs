use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :globalizer_api, GlobalizerApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :globalizer_api, GlobalizerApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "globalizer_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

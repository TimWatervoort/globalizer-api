# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :globalizer_api,
  ecto_repos: [GlobalizerApi.Repo]

# Configures the endpoint
config :globalizer_api, GlobalizerApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "82CzG9LjmenUFGOkEQP3FDEX4EKHWQDy/kMDm0l6IN7UiCBPZVnl9uShygeXp/FT",
  render_errors: [view: GlobalizerApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GlobalizerApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :globalizer_api, GlobalizerApiWeb.Auth.Guardian,
  issuer: "globalizer_api",
  secret_key: "U3dJAXKmaQ+PQukv/ZuvfHVHpYe2v33omYSrkaoaGwg/MB9zqn/xd8xNheZvlOZN"

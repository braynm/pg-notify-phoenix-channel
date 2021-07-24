# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pg_notify,
  ecto_repos: [PgNotify.Repo]

# Configures the endpoint
config :pg_notify, PgNotifyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5Eul/Ob2sNnS3AdAq8utWWPHomB7zJfgYz0rRlqzat/nj+LH/F55LntRXdnmi2Pd",
  render_errors: [view: PgNotifyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PgNotify.PubSub,
  live_view: [signing_salt: "omlnKGJa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

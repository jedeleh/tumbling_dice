import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
#  database: "tumbling_dice_test#{System.get_env("MIX_TEST_PARTITION")}",
config :tumbling_dice, TumblingDice.Repo,
  username: "postgres",
  password: "",
  hostname: "localhost",
  database: "tumbling_dice_test",
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tumbling_dice, TumblingDiceWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MRryt9FUe+f5cKhf/kqB/D5Ysr7o4gjgT6N55A8TwDLtb0WdR6s3sSYCMmekMmFY",
  server: false

# In test we don't send emails.
config :tumbling_dice, TumblingDice.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

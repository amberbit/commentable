use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ui, UiWeb.Endpoint,
  http: [port: 4002],
  server: true

config :ui, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ui, Ui.Repo,
  username: "postgres",
  password: "postgres",
  database: "ui_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure wallaby

config :wallaby,
  driver: Wallaby.Experimental.Chrome,
  chrome: [headless: true]

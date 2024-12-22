import Config

config :console_agenda, ConsoleAgenda.Repo,
  database: "postgres",
  username: "postgres",
  password: "1234",
  hostname: "localhost"

config :console_agenda, ecto_repos: [ConsoleAgenda.Repo]

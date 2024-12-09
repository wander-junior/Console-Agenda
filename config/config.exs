import Config

config :console_agenda, ConsoleAgenda.Repo,
  database: "console_agenda_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :console_agenda, ecto_repos: [ConsoleAgenda.Repo]

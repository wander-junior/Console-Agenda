defmodule ConsoleAgenda.Repo do
  use Ecto.Repo,
    otp_app: :console_agenda,
    adapter: Ecto.Adapters.Postgres

  use Paginator
end

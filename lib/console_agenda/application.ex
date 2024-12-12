defmodule ConsoleAgenda.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ConsoleAgenda.Repo,
      # Start the Telemetry supervisor
      # {ConsoleAgenda.Telemetry, []},
      # Start the PubSub system
      # {Phoenix.PubSub, name: ConsoleAgenda.PubSub},
      # Start a worker by calling: ConsoleAgenda.Worker.start_link(arg)
      # {ConsoleAgenda.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: ConsoleAgenda.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

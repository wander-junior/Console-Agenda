defmodule ConsoleAgenda.MixProject do
  use Mix.Project

  def project do
    [
      app: :console_agenda,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.10"},
      {:postgrex, "~> 0.17"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end

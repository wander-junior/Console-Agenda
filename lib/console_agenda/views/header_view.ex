defmodule ConsoleAgenda.Views.HeaderView do
  def render_header(datetime \\ NaiveDateTime.utc_now()) do
    IO.puts("########| AGENDA DE CONTATOS | #{datetime} |########")
  end
end

defmodule ConsoleAgenda.Views.HeaderView do
  def render_header() do
    IO.puts("########| AGENDA DE CONTATOS | #{format_date()} |########")
  end

  defp format_date() do
    Calendar.strftime(NaiveDateTime.utc_now(), "%d/%m/%y - %H:%M")
  end
end

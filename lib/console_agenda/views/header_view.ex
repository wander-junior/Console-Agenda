defmodule ConsoleAgenda.Views.HeaderView do
  def render_header(notification_text) do
    IO.puts("########| AGENDA DE CONTATOS | #{format_date()} |########")
    render_notification(notification_text)
  end

  defp format_date() do
    Calendar.strftime(NaiveDateTime.utc_now(), "%d/%m/%y - %H:%M")
  end

  defp render_notification(notification_text) do
    IO.puts("##### Notificação: #{notification_text}")
  end
end

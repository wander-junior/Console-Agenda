defmodule ConsoleAgenda.Views.RemoveView do
  alias ConsoleAgenda.Views.HeaderView

  def render_remove(current_try, max_tries, notification) do
    HeaderView.render_header(notification)
    remove_menu(current_try, max_tries)
  end

  defp remove_menu(current_try, max_tries) do
    formated_max_tries =
      max_tries
      |> Integer.to_string()
      |> String.pad_leading(2, "0")

    IO.write("\tTentativa 0#{current_try} de #{formated_max_tries} ...")
    IO.puts("\t[V]: Voltar ao Início")
  end
end

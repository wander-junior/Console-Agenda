defmodule ConsoleAgenda.Views.ContactTableView do
  def render_table(contacts) do
    amount_message(length(contacts))
  end

  defp amount_message(amount) do
    formated_amount = amount
    |> Integer.to_string
    |> String.pad_leading(2, "0")

    IO.puts("-------------| Há um total de #{formated_amount} contatos registrados |-------------")
  end
end

defmodule ConsoleAgenda.Views.ContactTableView do
  alias ConsoleAgenda.Views.ContactView

  def render_table(contacts, metadata, current_page) do
    amount_message(metadata.total_count)
    ContactView.contacts_header()
    contacts_table(contacts)
    table_footer(metadata, current_page)
    table_menu()
  end

  defp amount_message(amount) do
    formated_amount =
      amount
      |> Integer.to_string()
      |> String.pad_leading(2, "0")

    IO.puts(
      "-------------| Há um total de #{formated_amount} contatos registrados |-------------"
    )
  end

  defp contacts_table(contacts) do
    Enum.each(contacts, fn contact ->
      ContactView.contact_data(contact)
    end)
  end

  defp table_footer(metadata, current_page) do
    total_pages =
      Float.ceil(metadata.total_count / 5)
      |> trunc()
      |> Integer.to_string()
      |> String.pad_leading(2, "0")

    formated_curr_page = Integer.to_string(current_page) |> String.pad_leading(2, "0")

    IO.puts("#{String.duplicate("-", 47)}[Página #{formated_curr_page} de #{total_pages}]-")

    if metadata.before do
      IO.write("\t[A]: Página Anterior")
    end

    if metadata.after do
      IO.write("\t[P]: Próxima página")
    end

    IO.puts("")
  end

  defp table_menu do
    IO.puts("[I]: Inserir Contato\t[E]: Editar Contato")
    IO.puts("[R]: Remover Contato\t[S]: Sair")
  end
end

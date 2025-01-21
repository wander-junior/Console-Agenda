defmodule ConsoleAgenda.Controllers.InitialPage do
  alias ConsoleAgenda.{Repo, Contact, Views}
  @notification_message "Seja Bem Vindo(a)! (:D). E fique a vontade."
  import Ecto.Query

  def start do
    Views.HeaderView.render_header(@notification_message)

    Repo.start_link()

    paginated_and_render()
  end

  defp paginated_and_render(cursor \\ %{}) do
    query = from(c in Contact, order_by: [asc: c.inserted_at, asc: c.id])

    %{entries: entries, metadata: metadata} =
      Repo.paginate(
        query,
        include_total_count: true,
        cursor_fields: [:inserted_at, :id],
        limit: 5,
        after: Map.get(cursor, :after),
        before: Map.get(cursor, :before)
      )

      render(entries, metadata)
  end

  defp render(entries, metadata) do
    Views.ContactTableView.render_table(entries, metadata.total_count)
    handle_menu_input(entries, metadata)
  end

  defp handle_menu_input(entries, curr_metadata) do
    opt =
      IO.gets("Selecione uma opção > ")
      |> String.downcase()

    cond do
      opt == "a\n" ->
        paginated_and_render(%{before: curr_metadata.before})

      opt == "p\n" ->
        paginated_and_render(%{after: curr_metadata.after})

      opt == "i\n" ->
        IO.puts("Inserir Contato")

      opt == "r\n" ->
        IO.puts("Remover Contato")

      opt == "e\n" ->
        IO.puts("Editar Contato")

      opt == "s\n" ->
        IO.puts("Sair")

      true ->
        IO.puts("Digite uma opção válida")
        render(entries, curr_metadata)
    end
  end
end

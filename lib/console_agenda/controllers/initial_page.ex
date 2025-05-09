defmodule ConsoleAgenda.Controllers.InitialPage do
  alias ConsoleAgenda.{Repo, Contact, Views, Controllers}
  @notification_message "Seja Bem Vindo(a)! (:D). E fique a vontade."
  import Ecto.Query

  def start do
    Repo.start_link()

    paginated_and_render()
  end

  def paginated_and_render(
        cursor \\ %{},
        current_page \\ 1,
        notification_message \\ @notification_message
      ) do
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

    render(entries, metadata, current_page, notification_message)
  end

  defp render(entries, metadata, current_page, notification_message) do
    Views.HeaderView.render_header(notification_message)
    Views.ContactTableView.render_table(entries, metadata, current_page)
    handle_menu_input(entries, metadata, current_page)
  end

  defp handle_menu_input(entries, curr_metadata, current_page) do
    opt =
      case IO.gets("Selecione uma opção > ") do
        :eof -> ""
        input -> String.downcase(input)
      end

    cond do
      opt == "a\n" and curr_metadata.before ->
        paginated_and_render(%{before: curr_metadata.before}, max(current_page - 1, 1))

      opt == "p\n" and curr_metadata.after ->
        paginated_and_render(%{after: curr_metadata.after}, current_page + 1)

      opt == "i\n" ->
        Controllers.InsertPage.render_insert()

      opt == "r\n" ->
        Controllers.RemovePage.render_remove_page()

      opt == "e\n" ->
        Controllers.EditPage.edit_render()

      opt == "s\n" ->
        Views.ExitMessage.render_exit_message()

      true ->
        render(entries, curr_metadata, current_page, "Digite uma opção válida")
    end
  end
end

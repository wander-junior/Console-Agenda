defmodule ConsoleAgenda.Controllers.RemovePage do
  alias ConsoleAgenda.Views.RemoveView
  alias ConsoleAgenda.Controllers.InitialPage

  @max_tries 4
  @notification_message "Não sabe o ID do contato? Volte ao inicio e pesquise."

  def render_remove_page(current_try \\ 1, notification \\ @notification_message)

  def render_remove_page(current_try, notification) when current_try <= 4 do
    RemoveView.render_remove(current_try, @max_tries, notification)

    user_id =
      IO.gets("Informe o ID do contato: ")
      |> String.trim()

    case Integer.parse(user_id) do
      {id, ""} ->
        handle_deletion(id, current_try)

      _ when user_id in ["v", "V"] ->
        InitialPage.paginated_and_render()

      _ ->
        render_remove_page(current_try + 1, "Id do contato inválido")
    end
  end

  def render_remove_page(current_try, _) when current_try > 4 do
    InitialPage.paginated_and_render(
      %{},
      1,
      "Você excedeu o número limite de tentativas."
    )
  end

  defp handle_deletion(id, current_try) do
    contact = %ConsoleAgenda.Contact{id: id}

    with {:ok, _} <- ConsoleAgenda.Repo.delete(contact, stale_error_field: :custom_error) do
      InitialPage.paginated_and_render(
        %{},
        1,
        "Contato deletado com sucesso."
      )
    else
      {:error, _} -> render_remove_page(current_try + 1, "Erro ao deletar o contato")
    end
  end
end

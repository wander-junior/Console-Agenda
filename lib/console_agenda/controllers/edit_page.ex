defmodule ConsoleAgenda.Controllers.EditPage do
  alias ConsoleAgenda.Views.EditView
  alias ConsoleAgenda.{Repo, Contact}
  alias ConsoleAgenda.Controllers.InitialPage

  @max_tries 4
  @notification_message "Não sabe o ID do contato? Volte ao inicio e pesquise."
  @sucess_message "Contato atualizado com sucesso"
  @error_message "Falha ao atualizar o contato"

  def edit_render(current_try \\ 1, notification \\ @notification_message)

  def edit_render(current_try, notification) when current_try <= 4 do
    EditView.render_edit_page(current_try, @max_tries, notification)

    user_id =
      IO.gets("Informe o ID do contato: ")
      |> String.trim()

    case Integer.parse(user_id) do
      {id, ""} ->
        Repo.get(Contact, id)
        |> handle_user(current_try)

      _ when user_id in ["v", "V"] ->
        InitialPage.paginated_and_render()

      _ ->
        edit_render(current_try + 1, "Id do contato inválido")
    end
  end

  def edit_render(current_try, _) when current_try > 4 do
    InitialPage.paginated_and_render(
      %{},
      1,
      "Você excedeu o número limite de tentativas."
    )
  end

  defp handle_user(nil, current_try) do
    edit_render(current_try + 1)
  end

  defp handle_user(contact, _current_try) do
    EditView.edit_data(contact)

    new_data =
      EditView.name_prompt(%{
        id: contact.id
      })
      |> EditView.surname_prompt()
      |> EditView.phone_prompt()
      |> EditView.contact_type_prompt()

    contact
    |> Contact.changeset(new_data)
    |> update_contact()
  end

  defp update_contact(changeset) do
    case Repo.update(changeset) do
      {:ok, _} -> InitialPage.paginated_and_render(%{}, 1, @sucess_message)
      {:error, _} -> InitialPage.paginated_and_render(%{}, 1, @error_message)
    end
  end
end

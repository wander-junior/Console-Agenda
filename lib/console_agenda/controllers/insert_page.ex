defmodule ConsoleAgenda.Controllers.InsertPage do
  alias ConsoleAgenda.Controllers
  alias ConsoleAgenda.Views.InsertView

  @sucess_message "Contato inserido com sucesso"
  @error_message "Falha ao inserir o contato"

  def render_insert do
    InsertView.name_prompt()
    |> InsertView.last_name_prompt()
    |> InsertView.phone_prompt()
    |> InsertView.contact_type_prompt()
    |> ConsoleAgenda.Contact.changeset()
    |> insert_contact()
  end

  defp insert_contact(changeset) do
    case ConsoleAgenda.Repo.insert(changeset) do
      {:ok, _} -> Controllers.InitialPage.paginated_and_render(%{}, 1, @sucess_message)
      {:error, _} -> Controllers.InitialPage.paginated_and_render(%{}, 1, @error_message)
    end
  end
end

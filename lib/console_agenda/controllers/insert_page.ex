defmodule ConsoleAgenda.Controllers.InsertPage do
  alias ConsoleAgenda.Views.ContactView
  alias ConsoleAgenda.Controllers
  alias ConsoleAgenda.Views.InsertView

  @sucess_message "Contato inserido com sucesso"
  @error_message "Falha ao inserir o contato"

  def render_insert do
    InsertView.insert_header()

    name = IO.gets("Digite o nome do novo contato > ") |> String.trim()

    InsertView.header_step_two(name)

    last_name = IO.gets("Digite o sobrenome do novo contato > ") |> String.trim()

    InsertView.header_step_three(name, last_name)

    phone_number = IO.gets("Digite o número de telefone (com DDD) > ") |> String.trim()

    InsertView.header_step_four(name, last_name, phone_number)

    contact_type =
      IO.gets("Selecione uma opção > ")
      |> String.trim()
      |> ContactView.get_contact_type()

    ConsoleAgenda.Contact.changeset(%{
      first_name: name,
      last_name: last_name,
      phone_number: phone_number,
      contact_type: contact_type
    })
    |> insert_contact()
  end

  defp insert_contact(changeset) do
    case ConsoleAgenda.Repo.insert(changeset) do
      {:ok, _} -> Controllers.InitialPage.paginated_and_render(%{}, 1, @sucess_message)
      {:error, _} -> Controllers.InitialPage.paginated_and_render(%{}, 1, @error_message)
    end
  end
end

defmodule ConsoleAgenda.Controllers.InsertPage do
  alias ConsoleAgenda.Contact
  alias ConsoleAgenda.Controllers
  alias ConsoleAgenda.Views.InsertView

  def render_insert do
    InsertView.insert_header()

    name = IO.gets("Digite o nome do novo contato > ") |> String.trim()

    InsertView.header_step_two(name)

    last_name = IO.gets("Digite o sobrenome do novo contato > ") |> String.trim()

    InsertView.header_step_three(name, last_name)

    phone_number = IO.gets("Digite o número de telefone (com DDD) > ") |> String.trim()

    InsertView.header_step_four(name, last_name, phone_number)

    contact_type = IO.gets("Selecione uma opção > ") |> String.trim() |> get_contact_type()

    insert_contact(%ConsoleAgenda.Contact{first_name: name, last_name: last_name, phone_number: phone_number, contact_type: contact_type})
  end

  defp get_contact_type(number_type) do
    case number_type do
      "1" -> "Cônjugue"
      "2" -> "Namorado(a)"
      "3" -> "Amigo(a)"
      "4" -> "Família"
      "5" -> "Trabalho"
      "6" -> "Conhecido(a)"
    end
  end

  defp insert_contact(contact) do
    case ConsoleAgenda.Repo.insert(contact) do
      {:ok, _} -> Controllers.InitialPage.paginated_and_render()
      {:error, _} -> IO.puts("Falha ao inserir contato")
    end
  end
end

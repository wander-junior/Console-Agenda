defmodule ConsoleAgenda.Views.EditView do
  alias ConsoleAgenda.Views.{ContactView, HeaderView}

  def render_edit_page(current_try, max_tries, notification) do
    HeaderView.render_header(notification)
    IO.puts("---------------------| Atualizar contato existente |---------------------")
    edit_menu(current_try, max_tries)
  end

  defp edit_menu(current_try, max_tries) do
    formated_max_tries =
      max_tries
      |> Integer.to_string()
      |> String.pad_leading(2, "0")

    IO.write("\tTentativa 0#{current_try} de #{formated_max_tries} ...")
    IO.puts("\t[V]: Voltar ao Início")
  end

  def edit_data(contact) do
    HeaderView.render_header("Fique atento aos dados. Cuidado para não errar, hein?")
    IO.puts("---| Dados Antigos do Contato |---")
    ContactView.contacts_header()
    ContactView.contact_data(contact)
  end

  def name_prompt(contact) do
    IO.puts("--| Nova entrada de dados |--")

    name = IO.gets("Nome: ") |> String.trim()
    Map.put(contact, :first_name, name)
  end

  def surname_prompt(contact) do
    surname = IO.gets("Sobrenome: ") |> String.trim()
    Map.put(contact, :last_name, surname)
  end

  def phone_prompt(contact) do
    phone = IO.gets("Número com DDD: ") |> String.trim()

    Map.put(contact, :phone_number, phone)
  end

  def contact_type_prompt(contact) do
    IO.puts("----------| Tipo de Contato |----------")

    ContactView.type_list()

    contact_type =
      IO.gets("Selecione uma opção > ")
      |> String.trim()
      |> ContactView.get_contact_type()

    Map.put(contact, :contact_type, contact_type)
  end
end

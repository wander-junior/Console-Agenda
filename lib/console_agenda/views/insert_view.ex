defmodule ConsoleAgenda.Views.InsertView do
  alias ConsoleAgenda.Views.{ContactView, HeaderView}

  @notification_message "Fique atento aos dados. Cuidado para não errar, hein?"

  def insert_header do
    HeaderView.render_header(@notification_message)
    IO.puts("---------------------| Adicionar Novo Contato |---------------------")
  end

  def header_step_two(name) do
    insert_header()
    IO.puts("Nome: #{name}")
  end

  def header_step_three(name, last_name) do
    insert_header()
    IO.puts("Nome: #{name} #{last_name}")
  end

  def header_step_four(name, last_name, phone_number) do
    header_step_three(name, last_name)
    IO.puts("Número com DDD: #{phone_number}")
    ContactView.type_list()
  end

  def name_prompt() do
    insert_header()
    name = IO.gets("Digite o nome do novo contato > ") |> String.trim()
    Map.put(%{}, :first_name, name)
  end

  def last_name_prompt(contact) do
    header_step_two(contact.first_name)
    last_name = IO.gets("Digite o sobrenome do novo contato > ") |> String.trim()
    Map.put(contact, :last_name, last_name)
  end

  def phone_prompt(contact) do
    header_step_three(contact.first_name, contact.last_name)
    phone_number = IO.gets("Digite o número de telefone (com DDD) > ") |> String.trim()
    Map.put(contact, :phone_number, phone_number)
  end

  def contact_type_prompt(contact) do
    header_step_four(contact.first_name, contact.last_name, contact.phone_number)

    contact_type =
      IO.gets("Selecione uma opção > ")
      |> String.trim()
      |> ContactView.get_contact_type()

    Map.put(contact, :contact_type, contact_type)
  end
end

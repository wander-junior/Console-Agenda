defmodule ConsoleAgenda.Views.InsertView do
  alias ConsoleAgenda.Views
  @notification_message "Fique atento aos dados. Cuidado para não errar, hein?"

  def insert_header do
    Views.HeaderView.render_header(@notification_message)
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
    Views.ContactView.type_list()
  end
end

defmodule ConsoleAgenda.Views.ContactView do
  def contacts_header do
    IO.puts(
      String.pad_trailing("ID", 5) <>
        String.pad_trailing("Nome", 20) <>
        String.pad_trailing("Telefone", 20) <>
        String.pad_trailing("Tipo de Contato", 20)
    )

    IO.puts(String.duplicate("-", 65))
  end

  def contact_data(contact) do
    formatted_id =
      contact.id
      |> Integer.to_string()
      |> String.pad_leading(2, "0")

    IO.puts(
      String.pad_trailing("#{formatted_id}", 5) <>
        String.pad_trailing("#{contact.first_name} #{contact.last_name}", 20) <>
        String.pad_trailing(contact.phone_number, 20) <>
        String.pad_trailing(contact.contact_type, 20)
    )
  end

  def type_list() do
    IO.puts("---------| Tipo de Contato |---------")
    IO.puts("[1] Cônjugue   [2] Namorado(a)")
    IO.puts("[3] Amigo(a)   [4] Família")
    IO.puts("[5] Trabalho   [6] Conhecido")
  end

  def get_contact_type(number_type) do
    case number_type do
      "1" -> "Cônjugue"
      "2" -> "Namorado(a)"
      "3" -> "Amigo(a)"
      "4" -> "Família"
      "5" -> "Trabalho"
      "6" -> "Conhecido(a)"
    end
  end
end

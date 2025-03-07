defmodule ConsoleAgenda.Views.ContactViewTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ConsoleAgenda.Views.ContactView

  describe "contacts_header/0" do
    test "return correct string" do
      message =
        capture_io(fn ->
          ContactView.contacts_header()
        end)

      assert message =~ "ID"
      assert message =~ "Nome"
      assert message =~ "Telefone"
      assert message =~ "Tipo de Contato"
    end
  end

  describe "contact_data/1" do
    test "return string with correct data" do
      message =
        capture_io(fn ->
          ContactView.contact_data(%{
            id: 1,
            first_name: "Fulano",
            last_name: "Tal",
            phone_number: "31912345678",
            contact_type: "Cônjugue"
          })
        end)

      assert message =~ "01"
      assert message =~ "Fulano Tal"
      assert message =~ "31912345678"
      assert message =~ "Cônjugue"
    end
  end
end

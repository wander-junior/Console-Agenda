defmodule ConsoleAgenda.Views.ContactTableViewTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "render_table/1" do
      test "return correct info" do
        contacts = [
          %ConsoleAgenda.Contact{
            id: 1,
            first_name: "John",
            last_name: "Doe",
            phone_number: "123-456-7890",
            contact_type: "personal",
            inserted_at: ~N[2025-01-20 02:39:37],
            updated_at: ~N[2025-01-20 02:39:37]
          },
          %ConsoleAgenda.Contact{
            id: 2,
            first_name: "Jane",
            last_name: "Smith",
            phone_number: "987-654-3210",
            contact_type: "business",
            inserted_at: ~N[2025-01-20 02:39:37],
            updated_at: ~N[2025-01-20 02:39:37]
          },
          %ConsoleAgenda.Contact{
            id: 3,
            first_name: "Alice",
            last_name: "Johnson",
            phone_number: "555-555-5555",
            contact_type: "emergency",
            inserted_at: ~N[2025-01-20 02:39:37],
            updated_at: ~N[2025-01-20 02:39:37]
          }
        ]

        message = capture_io(fn ->
          ConsoleAgenda.Views.ContactTableView.render_table(contacts)
        end)

        assert message =~ "Há um total de 03 contatos registrados"
      end
  end
end

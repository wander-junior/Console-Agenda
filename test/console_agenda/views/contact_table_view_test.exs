defmodule ConsoleAgenda.Views.ContactTableViewTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ConsoleAgenda.Contact
  alias ConsoleAgenda.Views.ContactTableView

  describe "render_table/1" do
    test "return correct info" do
      metadata = %Paginator.Page.Metadata{
        after: "cursor",
        before: nil,
        limit: 5,
        total_count: 8,
        total_count_cap_exceeded: false
      }

      contacts = [
        %Contact{
          id: 1,
          first_name: "John",
          last_name: "Doe",
          phone_number: "123-456-7890",
          contact_type: "personal",
          inserted_at: ~N[2025-01-20 02:39:37],
          updated_at: ~N[2025-01-20 02:39:37]
        },
        %Contact{
          id: 2,
          first_name: "Jane",
          last_name: "Smith",
          phone_number: "987-654-3210",
          contact_type: "business",
          inserted_at: ~N[2025-01-20 02:39:37],
          updated_at: ~N[2025-01-20 02:39:37]
        },
        %Contact{
          id: 3,
          first_name: "Alice",
          last_name: "Johnson",
          phone_number: "555-555-5555",
          contact_type: "emergency",
          inserted_at: ~N[2025-01-20 02:39:37],
          updated_at: ~N[2025-01-20 02:39:37]
        }
      ]

      message =
        capture_io(fn ->
          ContactTableView.render_table(contacts, metadata, 1)
        end)

      assert message =~ "Há um total de 08 contatos registrados"

      assert message =~ "John Doe"
      assert message =~ "123-456-7890"
      assert message =~ "personal"
      assert message =~ "01"

      assert message =~ "Jane Smith"
      assert message =~ "987-654-3210"
      assert message =~ "business"
      assert message =~ "02"

      assert message =~ "Alice Johnson"
      assert message =~ "555-555-5555"
      assert message =~ "emergency"
      assert message =~ "02"
    end

    test "show correct options when there is metadata cursors" do
      metadata = %Paginator.Page.Metadata{
        after: "cursor",
        before: "cursor",
        limit: 5,
        total_count: 8,
        total_count_cap_exceeded: false
      }

      contacts = []

      message =
        capture_io(fn ->
          ContactTableView.render_table(contacts, metadata, 1)
        end)

      assert message =~ "[A]: Página Anterior"
      assert message =~ "[P]: Próxima página"
    end

    test "show correct options when there is'nt metadata cursors" do
      metadata = %Paginator.Page.Metadata{
        after: nil,
        before: nil,
        limit: 5,
        total_count: 8,
        total_count_cap_exceeded: false
      }

      contacts = []

      message =
        capture_io(fn ->
          ContactTableView.render_table(contacts, metadata, 1)
        end)

      refute message =~ "[A]: Página Anterior"
      refute message =~ "[P]: Próxima página"
    end
  end
end

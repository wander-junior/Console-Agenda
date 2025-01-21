defmodule ConsoleAgenda.Contact do
  use Ecto.Schema

  schema "contacts" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :string)
    field(:contact_type, :string)

    timestamps()
  end
end

defmodule ConsoleAgenda.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :contact_type, :string

    timestamps()
  end

  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:first_name, :last_name, :phone_number, :contact_type])
    |> validate_required([:first_name, :last_name, :phone_number, :contact_type])
  end
end

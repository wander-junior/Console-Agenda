defmodule ConsoleAgenda.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:first_name, :last_name, :phone_number, :contact_type]

  schema "contacts" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :string)
    field(:contact_type, :string)

    timestamps()
  end

  def changeset(contact \\ %__MODULE__{}, params) do
    contact
    |> cast(params, [:id | @required_params])
    |> validate_required(@required_params)
  end
end

defmodule ConsoleAgenda.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :contact_type, :string

      timestamps()
    end
  end
end

defmodule ConsoleAgenda do
  alias ConsoleAgenda.{Repo, Contact}

  def list_contacts do
    Repo.all(Contact)
  end

  def create_contact(attrs) do
    %Contact{}
    |> Contact.changeset(attrs)
    |> Repo.insert()
  end
end

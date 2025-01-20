defmodule ConsoleAgenda.Controllers.InitialPage do
  alias ConsoleAgenda.{Repo, Contact}
  @notification_message "Seja Bem Vindo(a)! (:D). E fique a vontade."

  def start do
    ConsoleAgenda.Views.HeaderView.render_header(@notification_message)

    Repo.start_link()

    Repo.all(Contact)
    |> IO.inspect()
  end
end

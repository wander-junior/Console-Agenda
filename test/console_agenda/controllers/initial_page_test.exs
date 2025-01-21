defmodule ConsoleAgenda.Controllers.InitialPageTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "start/0" do
    test "render all static infos" do
      message =
        capture_io(fn ->
          ConsoleAgenda.Controllers.InitialPage.start()
        end)

      assert message =~ "AGENDA DE CONTATOS"
      assert message =~ Calendar.strftime(NaiveDateTime.utc_now(), "%d/%m/%y - %H:%M")
      assert message =~ "##### Notificação: Seja Bem Vindo(a)! (:D). E fique a vontade."
    end
  end
end

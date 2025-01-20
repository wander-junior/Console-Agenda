defmodule ConsoleAgenda.Views.HeaderViewTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "render_header/1" do
    test "return correct header" do
      message = capture_io(fn ->
        ConsoleAgenda.Views.HeaderView.render_header("Minha notificação")
      end)

      assert message =~ "AGENDA DE CONTATOS"
      assert message =~ Calendar.strftime(NaiveDateTime.utc_now(), "%d/%m/%y - %H:%M")
      assert message =~ "##### Notificação: Minha notificação"
    end
  end
end

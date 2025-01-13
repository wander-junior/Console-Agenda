defmodule ConsoleAgenda.Views.HeaderViewTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "render_header/0" do
    test "return correct header" do
      fixed_datetime = ~N[2025-01-13 12:00:00]
      expected_response = "########| AGENDA DE CONTATOS | #{fixed_datetime} |########\n"


      message = capture_io(fn ->
        ConsoleAgenda.Views.HeaderView.render_header(fixed_datetime)
      end)

      assert expected_response == message
    end
  end
end

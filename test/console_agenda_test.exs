defmodule ConsoleAgendaTest do
  use ExUnit.Case
  doctest ConsoleAgenda

  test "greets the world" do
    assert ConsoleAgenda.hello() == :world
  end
end

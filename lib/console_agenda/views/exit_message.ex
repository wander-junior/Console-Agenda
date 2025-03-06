defmodule ConsoleAgenda.Views.ExitMessage do
  def render_exit_message do
    IO.write("Saindo do programa em: ")
    render_countdown()
  end

  defp render_countdown do
    IO.write("1... ")
    :timer.sleep(1000)
    IO.write("2... ")
    :timer.sleep(1000)
    IO.puts("3... ")
  end
end

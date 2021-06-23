defmodule Nasa do
  @moduledoc """
  Main module responsible to run the process.
  """

  alias Nasa.{Sonar, Parser, Printer}

  @spec process(binary()) :: [any()]
  def process(stream) do
    Parser.stream_to_struct!(stream)
    |> Enum.map(fn content ->
      apply_operation(content)
      |> Printer.print()
    end)
  end

  defp apply_operation(%{matrix: matrix, sonar: sonar, moviment: moviment} = _content) do
    Enum.reduce(moviment.actions, sonar, fn moviment, sonar ->
      apply_operation(moviment, sonar, matrix)
    end)
  end

  defp apply_operation("M", sonar, matrix) do
    {:ok, sonar} = Sonar.change_position(sonar, matrix)

    sonar
  end

  defp apply_operation(moviment, sonar, _matrix) do
    {:ok, sonar} = Sonar.change_coordinate(sonar, moviment)

    sonar
  end
end

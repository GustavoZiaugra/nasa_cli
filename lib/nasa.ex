defmodule Nasa do
  @moduledoc """
  Documentation for `Nasa`.
  """

  alias Nasa.{Sonar, Parser}

  def process(stream) do
    Parser.stream_to_struct!(stream)
    |> Enum.map(fn content ->
      apply_operation(content)
      |> IO.inspect()
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

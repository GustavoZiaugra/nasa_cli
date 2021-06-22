defmodule Nasa.Parser do
  @moduledoc """
  Module responsible to handle the input of a file and convert it to structures.
  """

  alias Nasa.{Sonar, Matrix, Moviment}

  def stream_to_struct!(stream) do
    parsed_stream =
      stream
      |> String.split("\n")
      |> Enum.filter(&("" != &1))
      |> Enum.filter(&(!is_nil(&1)))
      |> Enum.reduce([], fn line, acc -> [to_struct!(line) | acc] end)
      |> Enum.reverse()

    [matrix | content] = parsed_stream

    content
    |> Enum.chunk_every(2)
    |> Enum.into([], fn [sonar, moviment] ->
      %{matrix: matrix, sonar: sonar, moviment: moviment}
    end)
  end

  defp to_struct!(line) do
    line
    |> identify_content()
    |> set_struct(line)
  end

  def identify_content(line) do
    case String.length(line) do
      3 -> :matrix
      5 -> :sonar
      _ -> :moviments
    end
  end

  def set_struct(content_type, line) do
    case content_type do
      :matrix -> Matrix.apply(line)
      :sonar -> Sonar.apply(line)
      :moviments -> Moviment.build(line)
    end
  end
end

defmodule Nasa.Sonar do
  @moduledoc """
  Struct for a Sonar
  """
  alias __MODULE__
  alias Nasa.Matrix

  defstruct [:pos_x, :pos_y, :coordinate]

  @coordination %{
    "L" => %{"S" => "E", "E" => "N", "N" => "W", "W" => "S"},
    "R" => %{"E" => "S", "N" => "E", "W" => "N", "S" => "W"}
  }

  @type t :: %__MODULE__{
          pos_x: integer(),
          pos_y: integer(),
          coordinate: String.t()
        }

  @doc """
  Responsible to receive a line from a stream, parse it and set as Sonar structure.
  """
  @spec apply(String.t()) :: Sonar.t()
  def apply(line) do
    [pos_x, pos_y, coordinate] =
      String.split(line, "")
      |> Enum.filter(&("" != &1))
      |> Enum.filter(&(" " != &1))

    int_pos_x = String.to_integer(pos_x)
    int_pos_y = String.to_integer(pos_y)

    %Sonar{pos_x: int_pos_x, pos_y: int_pos_y, coordinate: coordinate}
  end

  @doc """
  Responsible to update the new coordinate from a Sonar according to the params.
  """
  @spec change_coordinate(Sonar.t(), String.t()) :: {:ok, Sonar.t()}
  def change_coordinate(%Sonar{} = sonar, moviment) do
    new_coordinate = @coordination[moviment][sonar.coordinate]

    sonar = Map.put(sonar, :coordinate, new_coordinate)

    {:ok, sonar}
  end

  @doc """
  Responsible to update the new position from a Sonar according to the params.
  """
  @spec change_position(Sonar.t(), Matrix.t()) :: {:ok, Sonar.t()}
  def change_position(%Sonar{} = sonar, matrix) do
    sonar =
      case sonar.coordinate do
        "N" ->
          increase_position(sonar, :y, matrix)

        "S" ->
          decrease_position(sonar, :y)

        "W" ->
          decrease_position(sonar, :x)

        "E" ->
          increase_position(sonar, :x, matrix)
      end

    {:ok, sonar}
  end

  defp increase_position(%Sonar{} = sonar, axis, matrix) do
    sonar =
      case axis do
        :x ->
          new_pos_x = sonar.pos_x + 1

          if new_pos_x > matrix.max_x do
            raise RuntimeError,
                  "The pos x of the Sonar cannot be bigger than the max_x of the Matrix"
          else
            Map.put(sonar, :pos_x, new_pos_x)
          end

        :y ->
          new_pos_y = sonar.pos_y + 1

          if new_pos_y > matrix.max_y do
            raise RuntimeError,
                  "The pos y of the Sonar cannot be bigger than the max_y of the Matrix"
          else
            Map.put(sonar, :pos_y, new_pos_y)
          end
      end

    sonar
  end

  defp decrease_position(%Sonar{} = sonar, axis) do
    sonar =
      case axis do
        :x ->
          new_pos_x = sonar.pos_x - 1
          Map.put(sonar, :pos_x, new_pos_x)

        :y ->
          new_pos_y = sonar.pos_y - 1
          Map.put(sonar, :pos_y, new_pos_y)
      end

    sonar
  end
end

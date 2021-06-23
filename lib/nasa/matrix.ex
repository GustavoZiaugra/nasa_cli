defmodule Nasa.Matrix do
  @moduledoc """
  Struct for a Matrix
  """
  alias __MODULE__

  defstruct [:max_x, :max_y]

  @type t :: %__MODULE__{
          max_x: Integer.t(),
          max_y: Integer.t()
        }

  def apply(line) do
    [max_x, max_y] =
      String.split(line, "")
      |> Enum.filter(&("" != &1))
      |> Enum.filter(&(" " != &1))

    int_max_pos_x = String.to_integer(max_x)
    int_max_pos_y = String.to_integer(max_y)

    %Matrix{max_x: int_max_pos_x, max_y: int_max_pos_y}
  end
end

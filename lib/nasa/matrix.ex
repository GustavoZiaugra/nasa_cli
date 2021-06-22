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

    %Matrix{max_x: max_x, max_y: max_y}
  end
end

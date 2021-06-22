defmodule Nasa.Sonar do
  @moduledoc """
  Struct for a Sonar
  """
  alias __MODULE__
  alias Nasa.Moviment

  defstruct [:pos_x, :pos_y, :coordinate]

  @type t :: %__MODULE__{
          pos_x: Integer.t(),
          pos_y: Integer.t(),
          coordinate: String.t()
        }

  def apply(line) do
    [pos_x, pos_y, coordinate] =
      String.split(line, "")
      |> Enum.filter(&("" != &1))
      |> Enum.filter(&(" " != &1))

    %Sonar{pos_x: pos_x, pos_y: pos_y, coordinate: coordinate}
  end
end

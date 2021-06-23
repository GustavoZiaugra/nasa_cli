defmodule Nasa.Moviment do
  @moduledoc """
  Struct for Moviment
  """

  alias __MODULE__

  defstruct [:actions]

  @type t :: %__MODULE__{
          actions: list()
        }

  @spec apply(String.t()) :: __MODULE__.t()
  def apply(line) do
    line =
      String.split(line, "")
      |> Enum.filter(&("" != &1))
      |> Enum.filter(&(" " != &1))

    %Moviment{actions: line}
  end
end

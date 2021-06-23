defmodule Nasa.Moviment do
  @moduledoc """
  Struct for Moviment
  """

  alias __MODULE__

  defstruct [:actions]

  @type t :: %__MODULE__{
          actions: list()
        }

  @doc """
  Responsible to receive a line from a stream, parse it and set as Moviment structure.
  """
  @spec apply(String.t()) :: __MODULE__.t()
  def apply(line) do
    line =
      String.split(line, "")
      |> Enum.filter(&("" != &1))
      |> Enum.filter(&(" " != &1))

    %Moviment{actions: line}
  end
end

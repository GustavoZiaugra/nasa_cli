defmodule Nasa.Printer do
  @moduledoc """
  Module responsible to print the result of the Nasa process.
  """

  alias Nasa.Sonar

  @doc """
  Prints a content from a sonar on the screen.
  """
  @spec print(Sonar.t()) :: :ok
  def print(%Sonar{} = sonar) do
    "#{sonar.pos_x} #{sonar.pos_y} #{sonar.coordinate}"
    |> IO.puts()
  end
end

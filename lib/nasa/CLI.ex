defmodule Nasa.CLI do
  @moduledoc """
  Command Line Interface for Nasa.
  """

  def main([option | _]) when option in ["-h", "--help"], do: print_help()

  def main([]) do
    IO.read(:stdio, :all)
  end

  defp print_help do
    """
    Nasa - A CLI responsible by run a sonar.
    ---------------------
    Usage:
      nasa < input.txt
    """
    |> IO.puts()
  end
end

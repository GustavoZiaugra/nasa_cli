defmodule Nasa.Printer do
  @moduledoc """
  Module responsible to print the result of the Nasa process.
  """

  alias Nasa.Sonar

  def print(%Sonar{} = sonar) do
    "#{sonar.pos_x} #{sonar.pos_y} #{sonar.coordinate}"
    |> IO.puts()
  end
end
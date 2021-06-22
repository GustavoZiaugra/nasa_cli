defmodule Nasa do
  @moduledoc """
  Documentation for `Nasa`.
  """

  alias Nasa.Parser

  def process(stream) do
    Parser.stream_to_struct!(stream)
  end
end

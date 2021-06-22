defmodule Nasa.ParserTest do
  use ExUnit.Case
  alias Nasa.Parser

  describe "Parser.stream_to_struct!/1" do
    test "it should parse a stream and return the correct structures" do
      assert """
             5 5
             1 2 N
             LMLMLMLMM
             """
             |> Parser.stream_to_struct!() ==
               [
                 %Nasa.Matrix{max_x: "5", max_y: "5"},
                 %Nasa.Sonar{coordinate: "N", pos_x: "1", pos_y: "2"},
                 %Nasa.Moviment{actions: ["L", "M", "L", "M", "L", "M", "L", "M", "M"]}
               ]
    end
  end
end

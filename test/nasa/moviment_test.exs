defmodule Nasa.MovimentTest do
  use ExUnit.Case
  alias Nasa.Moviment

  describe "Moviment.apply/1" do
    test "it should parse the content of a line stream" do
      line = "LRMRLMRLMRRML"

      assert Moviment.apply(line) == %Moviment{
               actions: ["L", "R", "M", "R", "L", "M", "R", "L", "M", "R", "R", "M", "L"]
             }
    end
  end
end

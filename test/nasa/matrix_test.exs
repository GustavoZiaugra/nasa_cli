defmodule Nasa.MatrixTest do
  use ExUnit.Case
  alias Nasa.Matrix

  describe "Matrix.apply/1" do
    test "it should parse the content of a line stream" do
      line = "1 2"

      assert Matrix.apply(line) == %Matrix{max_x: 1, max_y: 2}
    end
  end
end

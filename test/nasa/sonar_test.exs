defmodule Nasa.SonarTest do
  use ExUnit.Case
  alias Nasa.{Sonar, Matrix}

  describe "Sonar.apply/1" do
    test "it should parse the content of a line stream" do
      line = "1 2 N"

      assert Sonar.apply(line) == %Sonar{pos_x: 1, pos_y: 2, coordinate: "N"}
    end
  end

  describe "Sonar.change_position/2" do
    test "it should increase the pos x of a sonar" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "E"}
      matrix = %Matrix{max_x: 5, max_y: 5}

      assert Sonar.change_position(sonar, matrix) ==
               {:ok, %Sonar{pos_x: 2, pos_y: 2, coordinate: "E"}}
    end

    test "it should increase the pos y of a sonar" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "N"}
      matrix = %Matrix{max_x: 5, max_y: 5}

      assert Sonar.change_position(sonar, matrix) ==
               {:ok, %Sonar{pos_x: 1, pos_y: 3, coordinate: "N"}}
    end

    test "it should decrease the pos x of a sonar" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "W"}
      matrix = %Matrix{max_x: 5, max_y: 5}

      assert Sonar.change_position(sonar, matrix) ==
               {:ok, %Sonar{pos_x: 0, pos_y: 2, coordinate: "W"}}
    end

    test "it should decrease the pos y of a sonar" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "S"}
      matrix = %Matrix{max_x: 5, max_y: 5}

      assert Sonar.change_position(sonar, matrix) ==
               {:ok, %Sonar{pos_x: 1, pos_y: 1, coordinate: "S"}}
    end

    test "it should raise a RunTimeError if new pos x is bigger than the matrix max pos x" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "E"}
      matrix = %Matrix{max_x: 1, max_y: 5}

      assert_raise RuntimeError,
                   "The pos x of the Sonar cannot be bigger than the max_x of the Matrix",
                   fn ->
                     Sonar.change_position(sonar, matrix)
                   end
    end

    test "it should raise a RunTimeError if new pos y is bigger than the matrix max pos y" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "N"}
      matrix = %Matrix{max_x: 5, max_y: 2}

      assert_raise RuntimeError,
                   "The pos y of the Sonar cannot be bigger than the max_y of the Matrix",
                   fn ->
                     Sonar.change_position(sonar, matrix)
                   end
    end
  end

  describe "Sonar.change_coordinate/2" do
    test "it should change the coordinate when we pass R as argument" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "N"}

      assert Sonar.change_coordinate(sonar, "R") ==
               {:ok, %Sonar{pos_x: 1, pos_y: 2, coordinate: "E"}}
    end

    test "it should change the coordinate when we pass L as argument" do
      sonar = %Sonar{pos_x: 1, pos_y: 2, coordinate: "N"}

      assert Sonar.change_coordinate(sonar, "L") ==
               {:ok, %Sonar{pos_x: 1, pos_y: 2, coordinate: "W"}}
    end
  end
end

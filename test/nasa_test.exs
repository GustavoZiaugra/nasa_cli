defmodule NasaTest do
  use ExUnit.Case
  doctest Nasa

  test "greets the world" do
    assert Nasa.hello() == :world
  end
end

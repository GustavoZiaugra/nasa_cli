defmodule NasaTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "Nasa.process/1" do
    test "it should receive a stream, process the content and return the output" do
      assert capture_io(fn ->
               "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n"
               |> Nasa.process()
             end) =~ """
             1 3 N
             5 1 E
             """
    end
  end
end

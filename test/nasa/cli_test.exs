defmodule Nasa.CLITest do
  use ExUnit.Case
  alias Nasa.CLI
  doctest Nasa.CLI
  import ExUnit.CaptureIO

  describe "main/1" do
    test "sending -h as orgument, it should return help" do
      assert capture_io(fn ->
               ["-h"]
               |> CLI.main()
             end) =~ """
             Nasa - A CLI responsible by run a sonar.
             ---------------------
             Usage:
               nasa < input.txt
             """
    end

    test "sending --help as argument, it should return help" do
      assert capture_io(fn ->
               ["--help"]
               |> CLI.main()
             end) =~ """
             Nasa - A CLI responsible by run a sonar.
             ---------------------
             Usage:
               nasa < input.txt
             """
    end
  end
end

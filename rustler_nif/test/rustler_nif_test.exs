defmodule RustlerNifTest do
  use ExUnit.Case
  doctest RustlerNif

  test "greets the world" do
    assert RustlerNif.hello() == :world
  end
end

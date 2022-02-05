defmodule RedisKvTest do
  use ExUnit.Case
  doctest RedisKv

  test "greets the world" do
    assert RedisKv.hello() == :world
  end
end

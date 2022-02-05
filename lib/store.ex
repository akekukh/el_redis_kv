defmodule KeyVal.Store do
  def new() do
    Redix.start_link("redis://localhost:6379/3", name: __MODULE__)
  end

  def put(key, value) do
    Redix.command(__MODULE__, ["SET", key, value])
  end

  def get(key) do
    Redix.command(__MODULE__, ["GET", key])
  end

  def del(key) do
    Redix.command(__MODULE__, ["DEL", key])
  end
end

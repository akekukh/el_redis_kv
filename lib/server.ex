defmodule KeyVal.Server do
  def start do
    GenServer.start(__MODULE__, nil)
  end

  def init(_) do
    {:ok, KeyVal.Store.new()}
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def del(pid, key) do
    GenServer.cast(pid, {:del, key})
  end

  def handle_call({:get, key}, _, state) do
    {:reply, KeyVal.Store.get(key), state}
  end

  def handle_cast({:put, key, value}, _) do
    {:noreply, KeyVal.Store.put(key, value)}
  end

  def handle_cast({:del, key}, _) do
    {:noreply, KeyVal.Store.del(key)}
  end
end

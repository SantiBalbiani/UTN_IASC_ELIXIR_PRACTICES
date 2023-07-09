defmodule MiServidor do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(nil) do
    {:ok, []}
  end

  def handle_cast({:agregar_elemento, elemento}, estado) do
    {:noreply, [elemento | estado]}
  end

  def handle_call(:get_elems, __from, elEstado ) do
    {:reply, elEstado, elEstado}
  end

end

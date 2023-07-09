defmodule Post do
  use GenServer
    def start_link(estado) do
      GenServer.start_link(__MODULE__, estado)
    end

    def init(state) do
      {:ok, state}
    end

    def handle_cast({:like,from}, estadoActual) do
      nuevoEstado =  estadoActual + 1
      send from, {:ok, "#{inspect from} has dado like coño!"}
      {:noreply, nuevoEstado}
    end

    def handle_call(:getLikes, _from, elEstado) do
      #send from, {:ok, "La cantidad de likes es #{ inspect elEstado}"}
      {:reply, elEstado, elEstado}
    end

    #Encapsulo el cast del GenServer en el module Post
    def like(post) do
      GenServer.cast(post, {:like, self()})
    end
    #Encapsulo el call del GenServer en el module Post
    def getLikesDe(post) do
      GenServer.call(post, :getLikes)
    end

  end


  # {:ok, pid} = Post.start_link(4)

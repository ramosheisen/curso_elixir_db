defmodule CursoElixirDb.Registry do
  use GenServer

  import CursoElixirDb.HelperExplodingTopics

  @impl true
  def init(_) do
    set = MapSet.new()
    {:ok, set}
  end

  @impl true
  def handle_call({:lookup, name}, _from, map_names) do
    {:reply, Map.fetch(map_names, name), map_names}
  end

  @impl true
  def handle_cast({:create, %{titles: titles, description: description, searches: searches, growth: growth}}, _created) do
    data = create_exploding_topics(%{
      titles: titles, description: description, searches: searches, growth: growth
    })
    {:noreply, data}
  end

  # @impl true
  # def handle_cast({:create, name, valor}, map_names) do
  #   if Map.has_key?(map_names, name) do
  #     {:noreply, name}
  #   else
  #     {:noreply, Map.put(map_names, name, valor)}
  #   end
  # end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def create(server, map) do
    GenServer.cast(server, {:create, map, {}})
  end

end

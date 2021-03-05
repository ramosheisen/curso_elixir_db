defmodule CursoElixirDbWeb.ExplodingTopicsLive do
  use Phoenix.LiveView

  alias CursoElixirDb.HelperExplodingTopics

  def render(assigns) do
    Phoenix.View.render(CursoElixirDbWeb.ExplodingTopicsView, "index.html", assigns)
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(30000, self(), :update)

    %{assign: assign} = get_information(socket)

    {:ok, assign}
  end

  def handle_info(:update, socket) do
    %{assign: assign} = get_information(socket)

    {:noreply, assign}
  end

  def handle_event("inc_clean", _value, socket) do
    socket.assigns.exploding_topics |> Enum.map(fn e ->
      HelperExplodingTopics.delete_exploding_topics(e)
    end)

    %{assign: assign} = get_information(socket)

    {:noreply, assign}
  end

  def handle_event("inc_delete", %{"id" => id}, socket) do
    HelperExplodingTopics.delete_exploding_topics_by_id(id)

    %{assign: assign} = get_information(socket)

    {:noreply, assign}
  end

  defp get_information(socket) do
    results = HelperExplodingTopics.list_exploding_topics()

    %{assign: assign(
      socket,
      exploding_topics: results
    )}
  end

end

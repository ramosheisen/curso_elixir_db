defmodule CursoElixirDbWeb.ExplodingTopicsController do
  use CursoElixirDbWeb, :controller

  alias CursoElixirDb.HelperExplodingTopics
  alias CursoElixirDb.HelperExplodingTopics.ExplodingTopics

  def index(conn, _params) do
    exploding_topics = HelperExplodingTopics.list_exploding_topics()
    render(conn, "index.html", exploding_topics: exploding_topics)
  end

  def new(conn, _params) do
    changeset = HelperExplodingTopics.change_exploding_topics(%ExplodingTopics{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"exploding_topics" => exploding_topics_params}) do
    case HelperExplodingTopics.create_exploding_topics(exploding_topics_params) do
      {:ok, exploding_topics} ->
        conn
        |> put_flash(:info, "Exploding topics created successfully.")
        |> redirect(to: Routes.exploding_topics_path(conn, :show, exploding_topics))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exploding_topics = HelperExplodingTopics.get_exploding_topics!(id)
    render(conn, "show.html", exploding_topics: exploding_topics)
  end

  def edit(conn, %{"id" => id}) do
    exploding_topics = HelperExplodingTopics.get_exploding_topics!(id)
    changeset = HelperExplodingTopics.change_exploding_topics(exploding_topics)
    render(conn, "edit.html", exploding_topics: exploding_topics, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exploding_topics" => exploding_topics_params}) do
    exploding_topics = HelperExplodingTopics.get_exploding_topics!(id)

    case HelperExplodingTopics.update_exploding_topics(exploding_topics, exploding_topics_params) do
      {:ok, exploding_topics} ->
        conn
        |> put_flash(:info, "Exploding topics updated successfully.")
        |> redirect(to: Routes.exploding_topics_path(conn, :show, exploding_topics))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", exploding_topics: exploding_topics, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exploding_topics = HelperExplodingTopics.get_exploding_topics!(id)
    {:ok, _exploding_topics} = HelperExplodingTopics.delete_exploding_topics(exploding_topics)

    conn
    |> put_flash(:info, "Exploding topics deleted successfully.")
    |> redirect(to: Routes.exploding_topics_path(conn, :index))
  end
end

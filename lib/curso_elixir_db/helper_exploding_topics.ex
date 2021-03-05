defmodule CursoElixirDb.HelperExplodingTopics do
  @moduledoc """
  The HelperExplodingTopics context.
  """

  import Ecto.Query, warn: false
  alias CursoElixirDb.Repo

  alias CursoElixirDb.HelperExplodingTopics.ExplodingTopics

  @doc """
  Returns the list of exploding_topics.

  ## Examples

      iex> list_exploding_topics()
      [%ExplodingTopics{}, ...]

  """
  def list_exploding_topics do
    Repo.all(ExplodingTopics)
  end

  def find_exploding_topics_by_title(title) do
    from(et in ExplodingTopics, where: et.titles == ^title)
    |> Repo.one
  end

  @doc """
  Gets a single exploding_topics.

  Raises `Ecto.NoResultsError` if the Exploding topics does not exist.

  ## Examples

      iex> get_exploding_topics!(123)
      %ExplodingTopics{}

      iex> get_exploding_topics!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exploding_topics!(id), do: Repo.get!(ExplodingTopics, id)

  @doc """
  Creates a exploding_topics.

  ## Examples

      iex> create_exploding_topics(%{field: value})
      {:ok, %ExplodingTopics{}}

      iex> create_exploding_topics(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exploding_topics(attrs \\ %{}) do
    %ExplodingTopics{}
    |> ExplodingTopics.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exploding_topics.

  ## Examples

      iex> update_exploding_topics(exploding_topics, %{field: new_value})
      {:ok, %ExplodingTopics{}}

      iex> update_exploding_topics(exploding_topics, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exploding_topics(%ExplodingTopics{} = exploding_topics, attrs) do
    exploding_topics
    |> ExplodingTopics.changeset_update(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exploding_topics.

  ## Examples

      iex> delete_exploding_topics(exploding_topics)
      {:ok, %ExplodingTopics{}}

      iex> delete_exploding_topics(exploding_topics)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exploding_topics(%ExplodingTopics{} = exploding_topics) do
    Repo.delete(exploding_topics)
  end

  def delete_exploding_topics_by_id(id) do
    post = Repo.get!(ExplodingTopics, id)
    case Repo.delete post do
      {:ok, struct} -> {:ok, struct}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exploding_topics changes.

  ## Examples

      iex> change_exploding_topics(exploding_topics)
      %Ecto.Changeset{data: %ExplodingTopics{}}

  """
  def change_exploding_topics(%ExplodingTopics{} = exploding_topics, attrs \\ %{}) do
    ExplodingTopics.changeset(exploding_topics, attrs)
  end
end

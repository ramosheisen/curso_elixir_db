defmodule CursoElixirDb.HelperExplodingTopics.ExplodingTopics do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exploding_topics" do
    field :description, :string
    field :growth, :string
    field :searches, :string
    field :titles, :string

    timestamps()
  end

  @doc false
  def changeset(exploding_topics, attrs) do
    exploding_topics
    |> cast(attrs, [:titles, :description, :searches, :growth])
    |> validate_required([:titles, :description, :searches, :growth])
  end

  def changeset_update(exploding_topics, attrs) do
    exploding_topics
    |> cast(attrs, [:searches, :growth])
    |> validate_required([:searches, :growth])
  end
end

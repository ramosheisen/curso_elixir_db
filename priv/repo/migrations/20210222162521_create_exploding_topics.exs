defmodule CursoElixirDb.Repo.Migrations.CreateExplodingTopics do
  use Ecto.Migration

  def change do
    create table(:exploding_topics) do
      add :titles, :string
      add :description, :string
      add :email, :string
      add :searches, :string
      add :growth, :string

      timestamps()
    end

  end
end

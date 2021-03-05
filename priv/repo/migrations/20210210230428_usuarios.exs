defmodule CursoElixirDb.Repo.Migrations.Usuarios do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:document, :integer)
      add(:firstname, :text)
      add(:lastname, :text)

      timestamps()
    end
  end
end

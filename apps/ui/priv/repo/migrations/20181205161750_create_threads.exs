defmodule Ui.Repo.Migrations.CreateThreads do
  use Ecto.Migration

  def change do
    create table(:threads) do
      add :url, :text, null: false

      timestamps()
    end

    create unique_index(:threads, [:url])

    alter table(:comments) do
      add :thread_id, references(:threads, on_delete: :delete_all)
    end

    create index(:comments, [:thread_id])
  end
end

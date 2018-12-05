defmodule Ui.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string

    belongs_to :thread, Ui.Thread

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :thread_id])
    |> validate_required([:content, :thread_id])
  end
end

defmodule Ui.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  schema "threads" do
    field :url, :string

    has_many :comments, Ui.Comment

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> unique_constraint(:url)
  end
end

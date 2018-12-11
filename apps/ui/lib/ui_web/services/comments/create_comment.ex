defmodule Ui.CreateComment do
  @moduledoc """
    This is the service for creating comment.
  """

  import Ecto.Query

  @doc """
  Creates comment with given args.

  Returns `{:ok, comment}` on success.

  """
  def create_comment(args) do
    thread =
      from(
        t in Ui.Thread,
        where: t.url == ^args[:url]
      )
      |> Ui.Repo.one()

    %Ui.Comment{}
    |> Ui.Comment.changeset(%{
      content: args[:content],
      thread_id: thread.id
    })
    |> Ui.Repo.insert()
  end
end

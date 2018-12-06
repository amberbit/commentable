defmodule Ui.CreateComment do
  @moduledoc """
    This is the service for creating comment.
  """

  @doc """
  Creates comment with given args.

  Returns `{:ok, comment}` on success.

  """
  def create_comment(args) do
    %Ui.Comment{}
    |> Ui.Comment.changeset(%{
      content: args[:content],
      thread_id: args[:thread_id]
    })
    |> Ui.Repo.insert()
  end
end

defmodule Ui.ListComments do
  @moduledoc """
    This is the service for resolving lists of comments for thread with given url.
  """

  import Ecto.Query

  @doc """
  Queries comments for thread with given url.

  Returns a list of comments.

  """
  def list_comments(args) do
    thread =
      from(
        t in Ui.Thread,
        where: t.url == ^args[:url]
      )
      |> Ui.Repo.one()
      |> Ui.Repo.preload(:comments)

    case thread do
      nil ->
        {:ok, thread} =
          %Ui.Thread{}
          |> Ui.Thread.changeset(%{
            url: args[:url]
          })
          |> Ui.Repo.insert(on_conflict: :nothing)

        thread =
          thread
          |> Ui.Repo.preload(:comments)

        {:ok, thread.comments}

      _ ->
        {:ok, thread.comments}
    end
  end
end

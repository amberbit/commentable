defmodule Ui.ListComments do
  @moduledoc """
    This is the service for resolving lists of comments.
  """

  import Ecto.Query

  @doc """
  Queries the list of comments.

  Returns a list of comments.

  """
  def all_comments() do
    from(c in Ui.Comment)
    |> Ui.Repo.all()
  end
end

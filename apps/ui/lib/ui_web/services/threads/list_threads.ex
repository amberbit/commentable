defmodule Ui.ListThreads do
  @moduledoc """
    This is the service for resolving lists of threads.
  """

  import Ecto.Query

  @doc """
  Queries the list of threads.

  Returns a list of threads.

  """
  def list_threads() do
    from(c in Ui.Thread)
    |> Ui.Repo.all()
  end
end

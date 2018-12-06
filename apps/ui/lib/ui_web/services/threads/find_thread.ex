defmodule Ui.FindThread do
  @moduledoc """
    This is the service for findning thread by url.
  """

  import Ecto.Query

  @doc """
  Queries thread with given url.

  Returns `{:ok, thread}` on success.
  Returns `{:error, :not_found}` if thread was not found.

  """
  def find_thread(url) do
    thread =
      from(
        t in Ui.Thread,
        where: t.url == ^url
      )
      |> Ui.Repo.one()

    case thread do
      nil ->
        Ui.CreateThread.create_thread(url)

      _ ->
        {:ok, thread}
    end
  end
end

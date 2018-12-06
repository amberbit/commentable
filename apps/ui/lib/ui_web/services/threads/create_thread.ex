defmodule Ui.CreateThread do
  @moduledoc """
    This is the service for creating thread.
  """

  @doc """
  Creates thread with with given url.

  Returns `{:ok, thread}` on success.

  """
  def create_thread(url) do
    %Ui.Thread{}
    |> Ui.Thread.changeset(%{
      url: url
    })
    |> Ui.Repo.insert()
  end
end

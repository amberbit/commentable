defmodule Ui.CreateThread do
  @moduledoc """
    This is the service for creating threads.
  """

  @doc """
  Creates thread with given args.

  Returns created thread.

  """
  def create_thread(args) do
    %Ui.Thread{}
    |> Ui.Thread.changeset(%{
      url: args[:url]
    })
    |> Ui.Repo.insert()
  end
end

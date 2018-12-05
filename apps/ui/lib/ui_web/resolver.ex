defmodule UiWeb.Resolver do
  def list_comments(_root, _args, _info) do
    {:ok, Ui.ListComments.list_comments()}
  end

  def list_threads(_root, _args, _info) do
    {:ok, Ui.ListThreads.list_threads()}
  end
end

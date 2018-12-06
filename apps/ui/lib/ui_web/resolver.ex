defmodule UiWeb.Resolver do
  def list_comments(_root, _args, _info) do
    {:ok, Ui.ListComments.list_comments()}
  end
end

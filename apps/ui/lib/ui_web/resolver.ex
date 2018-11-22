defmodule UiWeb.Resolver do
  def all_comments(_root, _args, _info) do
    {:ok, Ui.ListComments.all_comments()}
  end
end

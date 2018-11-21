defmodule UiWeb.CommentsResolver do
  @fake_db %{
    "comments" => [
      %{id: 1, content: "First!"},
      %{id: 2, content: "Hi"}
    ]
  }

  def all_comments(_root, _args, _info) do
    {:ok, @fake_db["comments"]}
  end
end

defmodule UiWeb.Schema.CommentsQueries do
  use Absinthe.Schema.Notation

  object :comments_queries do
    @desc "Get list of comment by url"
    field :comments, list_of(non_null(:comment)) do
      arg(:url, non_null(:string))

      resolve(fn _, args, %{context: _} ->
        Ui.ListComments.list_comments(args)
      end)
    end
  end

  object :comments_mutations do
    @desc "Create a comment with the args"
    field :create_comment, type: :comment do
      arg(:content, non_null(:string))
      arg(:url, non_null(:string))

      resolve(fn _, args, %{context: _} ->
        Ui.CreateComment.create_comment(args)
      end)
    end
  end
end

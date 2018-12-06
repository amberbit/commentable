defmodule UiWeb.Schema.CommentsQueries do
  use Absinthe.Schema.Notation

  object :comments_mutations do
    @desc "Create a comment with the args"
    field :create_comment, type: :comment do
      arg(:content, non_null(:string))
      arg(:thread_id, non_null(:integer))

      resolve(fn _, args, %{context: _} ->
        Ui.CreateComment.create_comment(args)
      end)
    end
  end
end

defmodule UiWeb.Schema.CommentsQueries do
  use Absinthe.Schema.Notation

  object :comments_queries do
    @desc "Get all comments"
    field :comments, list_of(non_null(:comment)) do
      resolve(&UiWeb.Resolver.list_comments/3)
    end
  end
end

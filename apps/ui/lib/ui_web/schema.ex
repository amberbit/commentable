defmodule UiWeb.Schema do
  use Absinthe.Schema

  alias UiWeb.CommentsResolver

  object :comment do
    field :id, non_null(:id)
    field :content, non_null(:string)
  end

  query do
    field :comments, list_of(non_null(:comment)) do
      resolve(&CommentsResolver.all_comments/3)
    end
  end
end

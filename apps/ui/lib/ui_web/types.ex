defmodule UiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :comment do
    field :id, non_null(:id)
    field :content, non_null(:string)
    field :thread_id, non_null(:integer)
  end

  object :thread do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :comments, list_of(:comment), do: resolve(dataloader(Ui.RepoSource))
  end
end

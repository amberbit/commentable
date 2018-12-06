defmodule Ui.RepoSource do
  import Ecto.Query

  def data() do
    Dataloader.Ecto.new(Ui.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
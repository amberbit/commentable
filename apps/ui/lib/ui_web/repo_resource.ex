defmodule Ui.RepoSource do
  def data() do
    Dataloader.Ecto.new(Ui.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end

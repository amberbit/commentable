defmodule UiWeb.Schema do
  use Absinthe.Schema

  import_types(UiWeb.Schema.Types)
  import_types(UiWeb.Schema.ThreadsQueries)
  import_types(UiWeb.Schema.CommentsQueries)

  alias UiWeb.Resolver

  query do
    import_fields(:threads_queries)
  end

  mutation do
    import_fields(:threads_mutations)
    import_fields(:comments_mutations)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Ui.RepoSource, Ui.RepoSource.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end

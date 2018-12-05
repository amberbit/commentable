defmodule UiWeb.Schema.ThreadsQueries do
  use Absinthe.Schema.Notation

  object :threads_queries do
    @desc "Get all threads"
    field :threads, list_of(non_null(:thread)) do
      resolve(&UiWeb.Resolver.list_threads/3)
    end
  end

  object :threads_mutations do
    @desc "Create a thread with the args"
    field :create_thread, type: :thread do
      arg(:url, non_null(:string))

      resolve(fn _, args, %{context: _} ->
        Ui.CreateThread.create_thread(args)
      end)
    end
  end
end

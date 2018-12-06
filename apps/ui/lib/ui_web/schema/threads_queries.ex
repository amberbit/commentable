defmodule UiWeb.Schema.ThreadsQueries do
  use Absinthe.Schema.Notation

  object :threads_queries do
    @desc "Get thread by url"
    field :thread, :thread do
      arg(:url, non_null(:string))

      resolve(fn _, %{url: url}, %{context: _} ->
        Ui.FindThread.find_thread(url)
      end)
    end
  end

  object :threads_mutations do
    @desc "Create a thread with the args"
    field :create_thread, type: :thread do
      arg(:url, non_null(:string))

      resolve(fn _, %{url: url}, %{context: _} ->
        Ui.CreateThread.create_thread(url)
      end)
    end
  end
end

defmodule Ui.WallabyCase do
  @moduledoc """
  Module for tests with Wallaby / Chrome.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      import UiWeb.Router.Helpers
      import Wallaby.Query
    end
  end

  setup _tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Ui.Repo)

    # unless tags[:async] do
    Ecto.Adapters.SQL.Sandbox.mode(Ui.Repo, {:shared, self()})
    # end

    # metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Ui.Repo, self())
    # {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session} = Wallaby.start_session()
    {:ok, session: session}
  end
end

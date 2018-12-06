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

    Ecto.Adapters.SQL.Sandbox.mode(Ui.Repo, {:shared, self()})

    {:ok, session} = Wallaby.start_session()
    {:ok, session: session}
  end
end

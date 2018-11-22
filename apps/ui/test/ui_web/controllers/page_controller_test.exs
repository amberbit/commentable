defmodule UiWeb.PageControllerTest do
  use Ui.WallabyCase, async: true

  import Wallaby.Query, only: [css: 2]

  test "comments list is empty", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".comments", text: "Comments:"))
    |> find(css(".comment", count: 0))
  end
end

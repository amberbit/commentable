defmodule UiWeb.PageControllerTest do
  use Ui.WallabyCase, async: true

  import Wallaby.Query, only: [css: 2]

  test "comments list is visible", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".comments", text: "Comments:"))
    |> find(css(".comment", count: 2))
    |> List.first()
    |> assert_text("First!")
  end
end

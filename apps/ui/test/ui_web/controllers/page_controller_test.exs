defmodule UiWeb.PageControllerTest do
  use Ui.WallabyCase, async: true

  import Wallaby.Query

  test "comments list is empty at first, comment input is visible", %{session: session} do
    session
    |> visit("/?url=https://example.com/")
    |> find(css(".comments"))
    |> assert_has(text_field("Comment"))
    |> assert_has(css(".comment", count: 0))
  end

  test "after adding comment, comment is visible on the list", %{session: session} do
    session
    |> visit("/?url=https://example.com/")
    |> fill_in(text_field("Comment"), with: "First comment")
    |> click(button("Add comment"))
    |> find(css(".comments"))
    |> assert_has(css(".comment", text: "First comment"))
  end

  test "added comment is visible after reloading page", %{session: session} do
    session
    |> create_comment("/?url=https://example.com/")

    session
    |> visit("/?url=https://example.com/")
    |> find(css(".comments"))
    |> assert_has(css(".comment", text: "First comment"))
  end

  defp create_comment(session, url) do
    session
    |> visit(url)
    |> fill_in(text_field("Comment"), with: "First comment")
    |> click(button("Add comment"))
  end
end

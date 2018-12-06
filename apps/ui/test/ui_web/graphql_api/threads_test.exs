defmodule UiWeb.GraphQApi.ThreadsTest do
  use UiWeb.ConnCase
  import Ui.AbsintheHelpers

  @thread_query """
    query thread($url: String!) {
      thread(url: $url) {
        id
        url
        comments {
          id
          content
        }
      }
    }
  """

  describe "Thread:" do
    test "can query thread comments", %{conn: conn} do
      res =
        post(
          conn,
          "/api",
          query(@thread_query, "thread", %{url: "https://example.com/"})
        )

      assert length(json_response(res, 200)["data"]["thread"]["comments"]) == 0
    end
  end
end

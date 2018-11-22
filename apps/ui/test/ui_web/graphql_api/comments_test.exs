# defmodule UiWeb.PageControllerTest do
#   use UiWeb.ConnCase

#   test "GET /", %{conn: conn} do
#     conn = get(conn, "/")
#     assert html_response(conn, 200) =~ "hello-react"
#   end
# end

defmodule UiWeb.GraphQApi.CommentsTest do
  use UiWeb.ConnCase
  import Ui.AbsintheHelpers

  @comments_query """
    query comments {
      comments {
        id,
        content
      }
    }
  """

  describe "Comments:" do
    test "can query comments", %{conn: conn} do
      res =
        post(
          conn,
          "/api",
          query(@comments_query, "comments")
        )

      assert length(json_response(res, 200)["data"]["comments"]) == 2
    end
  end
end

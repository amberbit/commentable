defmodule UiWeb.GraphQApi.CommentsTest do
  use UiWeb.ConnCase
  import Ui.AbsintheHelpers

  @get_comments_query """
    query comments($url: String!) {
      comments(url: $url) {
        id
        content
      }
    }
  """

  @create_comment_query """
    mutation createComment($content: String!, $url: String!) {
      createComment(content: $content, url: $url) {
        id
        content
      }
    }
  """

  describe "Comments:" do
    test "can query comments for given url", %{conn: conn} do
      res =
        post(
          conn,
          "/api",
          query(@get_comments_query, "comments", %{url: "https://example.com/"})
        )

      assert length(json_response(res, 200)["data"]["comments"]) == 0
    end

    test "can add comment for given url", %{conn: conn} do
      create_comments_thread(conn)

      res =
        post(
          conn,
          "/api",
          query(@create_comment_query, "createComment", %{
            content: "First comment",
            url: "https://example.com/"
          })
        )

      assert json_response(res, 200)["data"]["createComment"]["id"]
    end
  end

  defp create_comments_thread(conn) do
    post(
      conn,
      "/api",
      query(@get_comments_query, "comments", %{url: "https://example.com/"})
    )
  end
end

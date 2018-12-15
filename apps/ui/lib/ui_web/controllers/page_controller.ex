defmodule UiWeb.PageController do
  use UiWeb, :controller

  def index(conn, _params) do
    conn
    |> delete_resp_header("x-frame-options")
    |> render("index.html")
  end
end

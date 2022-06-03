defmodule ToryWeb.PageController do
  use ToryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

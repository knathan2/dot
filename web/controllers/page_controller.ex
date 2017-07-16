defmodule Dot.PageController do
  use Dot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

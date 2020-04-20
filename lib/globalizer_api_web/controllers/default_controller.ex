defmodule GlobalizerApiWeb.DefaultController do
  use GlobalizerApiWeb, :controller

  def index(conn, _params) do
    text conn, "Hey, this is the index endpoint. That's pretty neat."
  end

end

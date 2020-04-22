defmodule GlobalizerApiWeb.UserView do
  use GlobalizerApiWeb, :view
  alias GlobalizerApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user_display.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{
      id: user.id,
      email: user.email,
      location: user.location,
      username: user.username,
      token: token
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      location: user.location,
      username: user.username
    }
  end

  def render("user_display.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      location: user.location,
      username: user.username
    }
  end
end

defmodule GlobalizerApiWeb.Router do
  use GlobalizerApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: "http://localhost:3000"
  end

  scope "/", GlobalizerApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    resources "/regions", RegionController, except: [:new, :edit]
    scope "/users" do
      post "/signup", UserController, :create
      post "/signin", UserController, :signin
      get "/", UserController, :index
      get "/:id", UserController, :show
    end
  end
end

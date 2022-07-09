defmodule ToryWeb.Router do
  use ToryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ToryWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ToryWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/parameters", ParameterController
    # resources "/parts", PartController
    # resources "/locations", LocationController
    # resources "/inventories", InventoryController

    live("/partslive", PartLive)

    live "/parts", PartLive.Index, :index
    live "/parts/new", PartLive.Index, :new
    live "/parts/:id/edit", PartLive.Index, :edit
    live "/parts/:id", PartLive.Show, :show
    live "/parts/:id/octopart_search", PartLive.OctopartSearch, :octopart_search

    live "/locations", LocationLive.Index, :index
    live "/locations/new", LocationLive.Index, :new
    live "/locations/:id/edit", LocationLive.Index, :edit
    live "/locations/:id", LocationLive.Show, :show
    live "/locations/:id/show/edit", LocationLive.Show, :edit

    live "/inventories", InventoryLive.Index, :index
    live "/inventories/new", InventoryLive.Index, :new
    live "/inventories/:id/edit", InventoryLive.Index, :edit
    live "/inventories/:id", InventoryLive.Show, :show
    live "/inventories/:id/show/edit", InventoryLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", ToryWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ToryWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

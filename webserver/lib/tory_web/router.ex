defmodule ToryWeb.Router do
  use ToryWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {ToryWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ToryWeb do
    pipe_through(:browser)

    get("/", PageController, :index)

    live("/part", PartLive.Index, :index)
    live("/part/new", PartLive.Index, :new)
    live("/part/:id/edit", PartLive.Index, :edit)
    live("/part/:id", PartLive.Show, :show)
    live("/part/:id/show/edit", PartLive.Show, :edit)

    live("/locations", LocationLive.Index, :index)
    live("/locations/new", LocationLive.Index, :new)
    live("/locations/:id/edit", LocationLive.Index, :edit)
    live("/locations/:id", LocationLive.Show, :show)
    live("/locations/:id/show/edit", LocationLive.Show, :edit)

    live("/manufacturers", ManufacturerLive.Index, :index)
    live("/manufacturers/new", ManufacturerLive.Index, :new)
    live("/manufacturers/:id/edit", ManufacturerLive.Index, :edit)
    live("/manufacturers/:id", ManufacturerLive.Show, :show)
    live("/manufacturers/:id/show/edit", ManufacturerLive.Show, :edit)

    live("/parameters", ParameterLive.Index, :index)
    live("/parameters/new", ParameterLive.Index, :new)
    live("/parameters/:id/edit", ParameterLive.Index, :edit)
    live("/parameters/:id", ParameterLive.Show, :show)
    live("/parameters/:id/show/edit", ParameterLive.Show, :edit)
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
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: ToryWeb.Telemetry)
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through(:browser)

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end

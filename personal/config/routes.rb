Rails.application.routes.draw do
  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  get 'healthcheck', to: 'home#status'
  root "home#index"
end

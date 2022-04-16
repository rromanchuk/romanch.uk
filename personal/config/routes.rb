Rails.application.routes.draw do
  resources :posts
  resource :sessions
  namespace :demo, path: "/demo" do
    root "utils#index"
  end
  
  get 'healthcheck', to: 'home#status'
  root "home#index"
end

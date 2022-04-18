Rails.application.routes.draw do
  resources :users
  resources :posts
  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  #get 'resume', to: 'home#resume'
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  root "home#index"
end

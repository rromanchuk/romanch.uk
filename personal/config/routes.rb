Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :posts
  resources :tags, only: [] do
    resources :posts, only: [:index]
  end

  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  #get 'resume', to: 'home#resume'
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  get 'login', to: "sessions#login"
  root "home#index"
end

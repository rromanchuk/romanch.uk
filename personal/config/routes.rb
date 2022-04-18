Rails.application.routes.draw do
  resources :users
  resources :posts
  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  namespace :oauth, path: "/oauth2/idpresponse" do
    root "cognito#authorize"
  end

  
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  root "home#index"
end

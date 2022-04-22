Rails.application.routes.draw do
  
  resources :users, only: [:show] do
    get :me, on: :collection
  end
  
  resources :posts, shallow: true do
    resources :tags
  end


  get :editor, to: 'home#editor'


  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  namespace :oauth do
    get "cognito/token", to: "cognito#token"
    get "cognito/authorize", to: "cognito#authorize"
  end

  #get 'resume', to: 'home#resume'
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  get 'login', to: "sessions#login"
  root "home#index"
end

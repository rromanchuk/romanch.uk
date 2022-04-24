Rails.application.routes.draw do
  
  resources :users, only: [:show] do
    get :me, on: :collection
  end
  
  resources :tags, param: :name, only: [] do
    resources :posts, only: [:index], on: :collection
  end
  resources :posts
  
  


  get :editor, to: 'home#editor'


  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  namespace :oauth do
    get "cognito/token", to: "cognito#token"
    get "cognito/authorize", to: "cognito#authorize"
  end

  #get 'resume', to: 'home#resume'
  get '/s/resume', to: 'resume#index'
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  get 'login', to: "sessions#login"
  root "home#index"
end

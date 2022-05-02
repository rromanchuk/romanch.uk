Rails.application.routes.draw do
  resources :modals, only: [] do 
    get :video, to: 'modals#video'
  end

  resources :users, only: [:show] do
    get :me, on: :collection
  end
  
  resources :tags, param: :name, only: [] do
    resources :posts, only: [:index], on: :collection
  end
  resources :posts
  resources :videos
  resources :images
  resources :projects, only: [:index, :show]




  namespace :demo, path: "/demo" do
    root "utils#index"
  end

  namespace :serve, path: "/serve" do
    resources :images, only: [:show]
    resources :videos, only: [:show]
  end

  namespace :oauth do
    get "cognito/token", to: "cognito#token"
    get "cognito/authorize", to: "cognito#authorize"
  end

  get '/s/resume', to: 'resume#index'
  get '/s/resume/video/:key', to: 'resume#video', as: :resume_video
  
  get 'fiddle', to: 'fiddle#index'
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  get 'login', to: "sessions#login"
  root "home#index"
end

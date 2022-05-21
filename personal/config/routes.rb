Rails.application.routes.draw do
  constraints host: ['romanchukopen.com'] do

  end
  resources :modals, only: [] do 
    get :video, to: 'modals#video'
  end

  resources :users, only: [:show, :index] do
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

  namespace :romanchuk_open, path: "/romanchuk_open" do
    resources :tournaments
    get "/pages/*id" => 'pages#show', as: :page, format: false
  end

  get '/s/resume', to: 'resume#index'
  get '/s/resume/download', to: 'resume#download', as: :download_resume
  
  get 'healthcheck', to: 'home#status'
  get 'logout', to: "sessions#logout"
  get 'login', to: "sessions#login"
  get "/pages/*id" => 'pages#show', as: :page, format: false
  get :healthcheck, to: 'pages#show', id: 'status'
  root to: 'pages#show', id: 'home'
end

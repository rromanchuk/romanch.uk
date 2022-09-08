require 'sidekiq/web'

class RomanchukOpenConstraint
  def matches?(request)
    ['romanchukopen.com', 'romanchukopen.test'].include?(request.domain)
  end
end

class PersonalConstraint
  def matches?(request)
    ['romanch.uk', 'personal.test'].include?(request.domain)
  end
end

Rails.application.routes.draw do
  get :healthcheck, to: 'pages#show', id: 'status'
  resources :posts
  resources :videos
  resources :blobs
  resources :attachments
  resources :projects, only: %i[index show]
  resources :users do
    get :me, on: :collection
  end

  scope 'romanchuk_open' do
    resources :tournaments, only: [] do
      resources :blobs, shallow: true
    end
  end

  resource :sessions, only: [] do
    get :apple_signin
    post :client
  end

  get 'account', to: 'sessions#account'
  get 'logout', to: 'sessions#logout'
  get 'login', to: 'sessions#login'
  get '/s/resume', to: 'resume#index'
  get '/s/resume/download', to: 'resume#download', as: :download_resume
  get '/pages/*id' => 'pages#show', as: :page, format: false

  namespace :serve, path: '/serve' do
    resources :images, only: [:show]
    resources :videos, only: [:show]
  end

  resources :tags, param: :name, only: [:index] do
    resources :posts, only: [:index], on: :collection
  end

  namespace :oauth do
    get 'cognito/token', to: 'cognito#token'
    get 'cognito/authorize', to: 'cognito#authorize'
    get 'cognito/authorize_apple', to: 'cognito#authorize_apple'
    get 'cognito/logout', to: 'cognito#logout'
  end

  namespace :romanchuk_open do
    resources :golfers
    resources :players do
      resources :golfers, only: [:new]
    end
    resources :tournaments do
      resources :golfers, only: [:index]
      get :newsletter, on: :member
    end
    get '/pages/*id' => 'pages#show', as: :page, format: false
  end

  namespace :pireps do
    resources :batch_files, only: %i[index show] do
      put :ingest, on: :collection
      put :process_csv, on: :collection
      put :persist_models, on: :collection
    end
    resources :raw_reports do
      get :uua, on: :collection
      get :ua, on: :collection
      get :airep, on: :collection
    end
  end
  mount Sidekiq::Web, at: '/sidekiq' # mount Sidekiq::Web in your Rails app
  mount PgHero::Engine, at: '/pghero'
  constraints(RomanchukOpenConstraint.new) do
    root 'romanchuk_open/tournaments#index', as: :romanchuk_open
  end

  constraints(PersonalConstraint.new) do
    get '/c/*attributed', to: 'pages#show', id: 'home'
    root to: 'pages#show', id: 'home'
  end
end

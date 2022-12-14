# rubocop:disable all
require 'sidekiq/web'
require 'sidekiq/cron/web'

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
  
  resources :posts do
    resources :tags, shallow: true
    get :recently_updated, on: :collection
  end
  resources :users do
    get :me, on: :collection
  end
  resources :aircraft_type_designators, only: %i[index show] do
    get :search, on: :collection
  end
  resources :videos
  resources :blobs
  resources :attachments
  resources :projects, only: %i[index show]

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
  post 'sign_in', to: 'sessions#sign_in'
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
      resources :blobs, only: [:show]
      resources :golfers, only: [:index]
      get :newsletter, on: :member
    end
    get '/pages/*id' => 'pages#show', as: :page, format: false
  end

  mount Sidekiq::Web, at: '/sidekiq' # mount Sidekiq::Web in your Rails app
  mount PgHero::Engine, at: '/pghero'

  constraints(RomanchukOpenConstraint.new) do
    root 'romanchuk_open/tournaments#index', as: :romanchuk_open
  end

  constraints(PersonalConstraint.new) do
    namespace :wx do
      resources :batches, only: %i[index show] do
        put :reprocess, on: :member
        put :ingest, on: :collection
        put :process_csv, on: :collection
        get :debug, on: :member
      end
  
      resources :metars, only: %i[index show destroy] do
        get :debug, on: :member
        get :points, on: :collection
      end
  
      resources :pireps, only: %i[index show] do
        get :uua, on: :collection
        get :ua, on: :collection
        get :debug, on: :member
        get :map, on: :member
        get :points, on: :collection
      end
      
      resources :aireps, only: %i[index show] do
        get :map, on: :member
        get :debug, on: :member
      end
      resources :tafs, only: %i[index show] do
        get :debug, on: :member
      end
    end

    get '/c/*attributed', to: 'pages#show', id: 'home'
    root to: 'pages#show', id: 'home'
  end
end

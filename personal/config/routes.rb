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
  draw :oauth
  draw :romanchuk_open
  draw :personal

  resources :tags, param: :name, only: [] do
    resources :posts, only: [:index], on: :collection
  end

  namespace :serve, path: '/serve' do
    resources :images, only: [:show]
    resources :videos, only: [:show]
  end

  get 'logout', to: 'sessions#logout'
  get 'login', to: 'sessions#login'

  get :healthcheck, to: 'pages#show', id: 'status'

  constraints(RomanchukOpenConstraint.new) do
    root 'romanchuk_open/tournaments#index', as: :romanchuk_open
  end

  constraints(PersonalConstraint.new) do
    get '/lidar/cardinal', to: 'three#cardinal'
    get "/c/*attributed", to: "pages#show", id: "home"
    root to: 'pages#show', id: 'home'
  end
end

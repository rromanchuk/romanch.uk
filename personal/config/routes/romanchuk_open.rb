namespace :romanchuk_open do
  resources :golfers
  resources :players
  resources :tournaments do
    resources :golfers, only: [:index]
    get :newsletter, on: :member
    resources :images, as: :imageable, only: [:show]
  end
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
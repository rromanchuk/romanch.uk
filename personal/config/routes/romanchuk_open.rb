namespace :romanchuk_open do
  resources :tournaments do
    get :players, on: :member
    get :newsletter, on: :member
  end
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
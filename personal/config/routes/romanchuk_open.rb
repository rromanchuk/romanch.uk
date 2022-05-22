namespace :romanchuk_open do
  resources :tournaments
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
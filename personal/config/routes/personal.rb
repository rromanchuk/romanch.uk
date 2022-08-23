
resources :posts
resources :videos
resources :images
resources :projects, only: [:index, :show]
resources :users, only: [:show, :index] do
  get :me, on: :collection
end

# get '/s/resume', to: 'resume#index'
# get '/s/resume/download', to: 'resume#download', as: :download_resume

get "/pages/*id" => 'pages#show', as: :page, format: false

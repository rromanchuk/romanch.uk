Rails.application.routes.draw do
  namespace :demo, path: "/demo" do
    root "utils#index"
  end
  
  root "home#index"
end

namespace :pireps do
  resources :pilot_reports, only: [:index, :show]
end
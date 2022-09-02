namespace :pireps do
  resources :pilot_reports, only: [:index, :show]
  resources :aircraft_reports, only: [:index, :show]
  resources :batch_files, only: [:index, :show]
end
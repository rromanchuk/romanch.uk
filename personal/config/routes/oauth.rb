namespace :oauth do
  get "cognito/token", to: "cognito#token"
  get "cognito/authorize", to: "cognito#authorize"
end
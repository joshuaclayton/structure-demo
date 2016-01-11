Rails.application.routes.draw do
  root "profile#show"

  resources :organizations, only: [:show]
end

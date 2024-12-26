Rails.application.routes.draw do
  resources :registrations

  #replace the main page
  root "events#index"

  resources :events
end

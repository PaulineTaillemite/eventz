Rails.application.routes.draw do

  #replace the main page
  root "events#index"

  resources :events do
    resources :registrations
  end
  
end

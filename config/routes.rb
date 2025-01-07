Rails.application.routes.draw do
  #replace the main page
  root "events#index"

  resources :events do
    resources :registrations
  end

  resources :users
  #get url signup for new action
  get "signup" => "users#new"

  resource :session, only: [:new, :create, :destroy]

  
end

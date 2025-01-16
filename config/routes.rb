Rails.application.routes.draw do
  resources :categories
  
  get "events/filter/:filter" => "events#index"

  #replace the main page
  root "events#index"

  resources :events do
    resources :registrations
    resources :likes
  end

  resources :users
  #get url signup for new action
  get "signup" => "users#new"

  resource :session, only: [:new, :create, :destroy]

  
end

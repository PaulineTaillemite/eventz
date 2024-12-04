Rails.application.routes.draw do

  #replace the main page
  root "events#index"

  get "events" => "events#index"
  #using :id as a variable
  get"events/:id"=>"events#show", as: "event"
  get "events/:id/edit"=>"events#edit", as: "edit_event"
end

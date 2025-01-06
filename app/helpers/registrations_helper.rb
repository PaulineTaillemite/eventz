module RegistrationsHelper

  def register_or_sold_out (event)
    if event.sold_out?
      "Sold out!"
    else 
      link_to "Register!", new_event_registration_path(event), class: "register"
    end

  end
end

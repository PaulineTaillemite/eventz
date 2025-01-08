module ApplicationHelper

  def current_user
    #if the user is not signed in query will return nil so we need to check if the session has a uder id
    User.find(session[:user_id]) if session[:user_id]
  end

end

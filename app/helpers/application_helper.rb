module ApplicationHelper

  def require_login
    if session[:user_id]
    redirect_to signup_path if !User.find(session[:user_id])
    end

  end
end

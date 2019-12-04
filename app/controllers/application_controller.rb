class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in, :admin_access
  
  def current_user 
    if session[:user_id].present?
      user = User.find_by(id: session[:user_id])
    end 
  end 

  def logged_in
    if current_user
    else 
      redirect_to root_path 
    end 
  end 

  def admin_access
    unless current_user.admin
      flash[:notice] = "Only admins can do that!"
      redirect_to user_path(current_user)
    end 
  end 

end



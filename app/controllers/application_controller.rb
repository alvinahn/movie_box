class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_access
    if !admin
      flash[:alert] = "You don't have access since you are not an admin."
      redirect_to new_session_path
    end
  end

  def admin
    @admin = User.find(session[:user_id]) if session[:user_id]
    @admin.admin == true
  end

  helper_method :current_user
  helper_method :admin

end

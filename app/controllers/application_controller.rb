class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    unless current_user
      redirect_to '/login'
    end
  end

  def is_admin?
    unless current_user.admin
      redirect_to books_path, notice: "You're not an admin"
    end
  end


end

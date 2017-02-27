class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login', alert: "Sie müssen sich zunächst anmelden!" unless current_user
  end

  def authorize_admin
    if User.find_by_username("admin")
      if current_user
        if !(current_user.username == "admin")
          redirect_to '/login', alert: "Sie müssen als Administrator angemeldet sein!"
        end
      else
        redirect_to '/login', alert: "Sie müssen als Administrator angemeldet sein!"
      end
    end
  end
end

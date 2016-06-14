class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'application'
  helper_method :current_user

  protected
  def current_user
    @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def authenticate
    unless current_user
      redirect_to new_session_url
    end
  end
end

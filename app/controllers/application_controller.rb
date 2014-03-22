class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    current_kid || current_adult
  end

  def authenticate_user!
    authenticate_kid! || authenticate_adult!
  end

end

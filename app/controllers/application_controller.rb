class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    if logged_in?
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

end

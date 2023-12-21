class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.first
  end
  helper_current_user :current_user
end

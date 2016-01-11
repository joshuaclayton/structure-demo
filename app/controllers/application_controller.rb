class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery with: :exception

  def current_user_organization
    if current_user
      @_current_user_organization ||= current_user.organization
    end
  end

  helper_method :current_user_organization
end

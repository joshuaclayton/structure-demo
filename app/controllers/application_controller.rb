class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery with: :exception

  before_filter :find_organization

  def find_organization
    if current_user
      @organization = current_user.organization
    end
  end
end

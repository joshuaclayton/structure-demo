class ProfileController < ApplicationController
  def show
    @organization = current_user_organization
  end
end

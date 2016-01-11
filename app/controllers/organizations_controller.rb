class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])

    if session[:last_viewed]
      @new_users = User.where("created_at > ?", Time.parse(session[:last_viewed]))
    else
      @new_users = []
    end

    session[:last_viewed] = Time.current
  end
end

module UsersHelper
  def render_users_collection(organization:)
    if current_user.organization == organization
      session[:last_viewed] = Time.current
    end

    render "users/list", organization: organization
  end
end

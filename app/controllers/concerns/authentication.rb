module Authentication
  extend ActiveSupport::Concern

  def current_user
    User.find_by(email: "person@example.com")
  end

  included do
    helper_method :current_user
  end
end

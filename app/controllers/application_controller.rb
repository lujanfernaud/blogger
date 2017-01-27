class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :admin, :admin?, :demo_user, :demo_user?

  def admin
    @admin = Author.find(1)
  end

  def admin?
    current_user == admin
  end

  def demo_user
    @demo_user = Author.find(4)
  end

  def demo_user?
    current_user == demo_user
  end
end

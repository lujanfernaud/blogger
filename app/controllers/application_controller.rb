class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :demo_user

  def demo_user
    @demo_user = Author.find(4)
  end
end

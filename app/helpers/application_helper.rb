module ApplicationHelper
  def admin
    Author.where(admin: true).take
  end

  def admin?
    return false unless current_user

    current_user.admin?
  end

  def demo_user
    Author.where(demo: true).take
  end

  def demo_user?
    return false unless current_user

    current_user.demo?
  end
end

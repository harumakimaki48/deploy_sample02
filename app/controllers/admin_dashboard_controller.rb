class AdminDashboardController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def require_admin_login
    unless logged_in?
      redirect_to admin_login_path, alert: "Please log in to access the admin dashboard."
    end
  end
end

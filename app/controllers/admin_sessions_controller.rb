class AdminSessionsController < ApplicationController
  def new
  end

  def create
    @admin = login(params[:email], params[:password].strip)
    if @admin
      redirect_back_or_to admin_dashboard_index_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Login failed"
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "Logged out!"
  end
end

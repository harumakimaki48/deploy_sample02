class Admin::SessionsController < ApplicationController
    def new
    end

    def create
      @admin = login(params[:email], params[:password])

      if @admin
        redirect_to admin_dashboard_path, notice: "ログインに成功しました。"
      else
        flash.now[:alert] = "ログインに失敗しました。"
        render :new
      end
    end

    def destroy
      logout
      redirect_to admin_login_path, notice: "ログアウトしました。"
    end
end

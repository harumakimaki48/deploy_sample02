class Admin::ShopsController < ApplicationController
    before_action :set_shop, only: [ :edit, :update, :destroy ]

    def index
      @shops = Shop.all
    end

    def new
      @shop = Shop.new
    end

    def create
    # holidayとtagをカンマ区切りの文字列に変換して保存
    holidays = params[:shop][:holiday].join(",") if params[:shop][:holiday]
    tags = params[:shop][:tag_ids].join(",") if params[:shop][:tag_ids]

    @shop = Shop.new(shop_params.merge(holiday: holidays, tag: tags))

    if @shop.save
      redirect_to admin_shops_path, notice: "店舗情報が保存されました"
    else
      render :new
    end
  end

    def edit
    end

    def update
      holidays = params[:shop][:holiday].join(",") if params[:shop][:holiday].present? # 選択された定休日をカンマ区切りの文字列に変換
      if @shop.update(shop_params.merge(holiday: holidays))
        redirect_to admin_shops_path, notice: "店舗情報が更新されました"
      else
        render :edit
      end
    end

    def destroy
      @shop.shop_tags.destroy_all
      @shop.destroy
      redirect_to admin_shops_path, notice: "店舗情報を削除しました。"
    end

    def show
    end

    private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name, :opening_time, :closing_time, :url, holiday: [], tag_ids: []) # 'holiday' を 'holidays: []' に変更
    end
end

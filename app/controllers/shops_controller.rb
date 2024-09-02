class ShopsController < ApplicationController
  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)

    if params[:q] && params[:q][:tags_id_eq].present?
        @shops = @shops.joins(:tags).where(tags: { id: params[:q][:tags_id_eq] })
    end
end

def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shops_path, notice: "店舗が追加されました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to admin_shops_path, notice: "店舗情報が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to admin_shops_path, notice: "店舗が削除されました"
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :opening_time, :closing_time, :holiday, :url) # 必要な属性を追加
  end
end

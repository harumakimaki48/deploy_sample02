class Admin::TagsController < ApplicationController
    before_action :set_tag, only: [ :edit, :update, :destroy ]
    def index
        @tags = Tag.all
        @tag = Tag.new
      end

      def create
        @tag = Tag.new(tag_params)
        if @tag.save
          redirect_to admin_tags_path, notice: "タグが作成されました。"
        else
          render :index
        end
      end

      def edit
      end

      def update
        if @tag.update(tag_params)
          redirect_to admin_tags_path, notice: "タグが更新されました。"
        else
          render :edit
        end
      end

      def destroy
        @tag.destroy
        redirect_to admin_tags_path, notice: "タグが削除されました。"
      end

      private

      def set_tag
        @tag = Tag.find(params[:id])
      end

      def tag_params
        params.require(:tag).permit(:name)
      end
end

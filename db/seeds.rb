# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Shop.create!(
  name: "サンプルショップ",                   # 店舗名
  address: "東京都渋谷区道玄坂1-2-3",       # 住所
  opening_time: "10:00",                    # 開店時間
  closing_time: "22:00",                    # 閉店時間
  holiday: "水曜日",                        # 定休日
  url: "https://example.com"                # URL
)
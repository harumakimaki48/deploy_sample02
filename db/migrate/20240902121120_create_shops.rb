class CreateShops < ActiveRecord::Migration[7.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.time :opening_time
      t.time :closing_time
      t.string :holiday
      t.text :url

      t.timestamps
    end
  end
end

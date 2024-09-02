class Tag < ApplicationRecord
  has_many :shop_tags
  has_many :shops, through: :shop_tags
  has_many :shop_tags, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "closing_time", "holiday", "name", "opening_time" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "closing_time", "holiday", "name", "opening_time" ]
  end
end

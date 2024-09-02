class Shop < ApplicationRecord
    has_many :shop_tags
  has_many :tags, through: :shop_tags

    def self.ransackable_attributes(auth_object = nil)
        [ "closing_time", "holiday", "name", "opening_time" ]
    end

    def self.ransackable_associations(auth_object = nil)
        [ "closing_time", "holiday", "name", "opening_time" "tags" ]
    end

    def self.ransackable_associations(auth_object = nil)
        [ "tags" ]
    end
end

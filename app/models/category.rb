class Category < ApplicationRecord
  has_many :video_category_relationships,
                                         dependent: :destroy
  has_many :videos, through: :video_category_relationships
end

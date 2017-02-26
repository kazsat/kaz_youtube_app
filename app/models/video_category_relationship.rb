class VideoCategoryRelationship < ApplicationRecord
  belongs_to :video
  belongs_to :category
  validates :video_id, presence: true
  validates :category_id, presence: true
  
  
end

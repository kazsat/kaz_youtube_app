class Video < ApplicationRecord
  belongs_to :user
  has_many :video_category_relationships,
                                         dependent: :destroy
  has_many :categories, through: :video_category_relationships
  
  default_scope -> { order(created_at: :desc) }
  validates :user_id,presence:true
  validates :title,presence:true,length: {maximum:50}
  validates :description ,length: {maximum:300}
  #urlの正規表現 正しいかチェックの必要あり
  VALID_URL_REGEX = /\A(https:\/\/www.youtube.com\/watch\?v=)([-\w]{11})\z/
  validates :url,presence:true,format: {with: VALID_URL_REGEX}
  
  
end

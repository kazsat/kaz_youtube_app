class User < ApplicationRecord
  has_many :videos, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name ,presence: true,length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,presence: true,length: { maximum: 255 },
                                  format: {with: VALID_EMAIL_REGEX},
                                  uniqueness: {case_sensitive: false}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i                               
  validates :password,presence: true,length: {minimum:8},
                                     format: {with: VALID_PASSWORD_REGEX}
  has_secure_password
end
